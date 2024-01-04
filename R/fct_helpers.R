#' helpers
#'
#' @description fct to create histogram
#'
#' @return histogram
#'
#' @noRd


my_histogram <- function(data, breaks, main) {
  hist(
    x = data,
    breaks = breaks,
    main = main
  )
}

