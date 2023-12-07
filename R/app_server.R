#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic
  my_mtcars <- reactive({
    mtcars
  })

  output$tbl_mtcars <- renderTable({ my_mtcars()})
}
