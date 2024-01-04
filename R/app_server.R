#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {

  # get histogram server outputs - you could use `{{zeallot}}` if preferred
  hist_output <- histpageServer("hist")
  # selected_var is reactive, whereas the highlight_colour is not
  #   the user can change the selected variable, but the developer
  #   chooses the colour. You could only pass the reactive's value
  #   using hist_output$selected_var(), but then the module will not
  #   respond to updates.
  tablepageServer(
    "table",
    selected_var = hist_output$selected_var,
    highlight_colour = "coral"
  )
}
