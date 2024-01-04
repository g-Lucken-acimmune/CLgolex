#' table_page
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#' @importFrom DT renderDT
#' @importFrom DT formatStyle
#' @importFrom DT datatable
#' @import tidyverse
#' @import magrittr

tablepageUI <- function(id){
  tagList(
    h2("Table Page"),
    DT::DTOutput(NS(id, "dt_table"))
  )
}

#' name_of_module1 Server Functions
#'
#' @noRd
tablepageServer <- function(id, selected_var, highlight_colour = "azure") {

  # quickly check the module input is reactive
  stopifnot(is.reactive(selected_var))
  stopifnot(!is.reactive(highlight_colour))

  moduleServer(id, function(input, output, session) {

    df_table <- reactive({
      datatable(mtcars) %>%
        formatStyle(
          # selected_var is the reactive value passed from the histogram page
          selected_var(),
          backgroundColor = highlight_colour
        )
    })

    output$dt_table <-DT::renderDT({
      df_table()
    })
  })
}


## To be copied in the UI
# tablepageUI("table")

## To be copied in the server
# tablepageServer("table", selected_var = "wt")
