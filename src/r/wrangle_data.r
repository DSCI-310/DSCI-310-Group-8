#' Wrangle the df and keep only the interested variables (unquoted)
#' and output should have same type as of df.
#'
#' @param df A data frame that needs to be wrangle
#' @param ... unquoted variables names to select data
#'
#' @return A data frame that contains only those variables
#' specified
#' @export
#'
#' @examples
#' wrangle_data(mtcars, mpg)
#' wrangle_data(mtcars, mpg, disp)
wrangle_data <- function(df, ...) {
  vars <- substitute(list(...))
  cols <- sapply(vars,deparse)[-1]
  if (!is.data.frame(df)) {
    stop("df must be a dataframe, please try again!")
  } else
    df |>
    dplyr::select(tidyselect::all_of(cols))
}
