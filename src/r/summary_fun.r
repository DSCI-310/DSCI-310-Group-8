#' summary function that applies a function to whole data frame
#' while removing na values
#' @param df A data frame that is interested to apply a summary
#' function to (eg. mean, standard deviation)
#' @param fun a function to apply for the input df
#'
#' @return a data.frame that shows a summary statistic for each column
#' in the original input df, and rounded to one decimal place
#' @export
#'
#' @examples
#' summary_fun(mtcars, mean)
#' summary_fun(mtcars, sd)
#' summary_fun(mtcars, max)
summary_fun <- function(df, fun) {
  if (!is.data.frame(df)) {
    stop("Df should be a dataframe")
  } else if (!is.function(fun)){
    stop("fun must be a function only")
    
  } else if (nrow(df) < 1) {
    return(data.frame(mean = numeric(0)))
  }
  round(purrr::map_df(df, fun, na.rm = TRUE), 1)
}

