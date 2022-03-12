#' summary function that applies a function to whole data frame
#' while removing na values
#' @param df A data frame that is interested to apply a summary 
#' function to (eg. mean, standard deviation)
#' @param fun 
#'
#' @return A tibble that shows a summary statistic for each column
#' in the original input df
#' @export
#'
#' @examples
#' summary_fun(user_training, mean)
#' summary_fun(user_testing, sd)
#' summary_fun(df, max)
summary_fun <- function(df, fun) {
  if (!is.data.frame(df)) {
    stop("Df must be a dataframe only")
  }
  
  if(!is.function(fun)){
    stop("fun must be a function only")
  }
    purrr::map_df(df, fun, na.rm = TRUE)
}

