#' hist_page
#'
#' @description Module for Histogram Page
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#' @import glue

histpageUI <- function(id){
  # return tag list to bundle components together without saying how they will
  #   be laid out
  tagList(
    h2("Plots Page"),
    fluidRow(
      column(
        2,
        # Use "NS()" to combine module id and component id
        selectInput(NS(id, "var"), "Variable", choices = names(mtcars)),
        numericInput(NS(id, "bins"), "Bins", value = 10, min = 1)
      ),
      column(
        10,
        plotOutput(NS(id, "plot"))
      )
    )
  )
}

#' name_of_module2 Server Functions
#'
#' @noRd

histpageServer <- function(id){

  moduleServer(id, function(input, output, session) {
    data <- reactive(mtcars[[input$var]])
    output$plot <- renderPlot({
      my_histogram(
        data(),
        breaks = input$bins,
        main = glue::glue('Histogram of {input$var}')
      )
    })
    # return the selected variable in a list
    #   this allows more outputs to be added later
    list(
      selected_var = reactive(input$var)
    )
  })
}

## To be copied in the UI
# histpageUI("plots")

## To be copied in the server
# histpageServer("plots")
