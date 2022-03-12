#' Wrangle the df and keep only the interested variables eg
#' STG AND PEG ONLY in this case,
#'
#' @param df A data frame that needs to be wrangle
#' @param vars set default to STG and PEG here, but it is
#' overridable by user
#' @return A data frame that contains only those variables 
#' specified
#' @export
#'
#' @examples
#' wrangle_data(data_1)
#' wrangle_data(data_2)
#' wrangle_data(data_1, vars = c("SCG", "STR"))
wrangle_data <- function(df, vars = interest_variables) {
    if(!is.data.frame(df)) {
      stop("df must be a dataframe, please try again!")
    }
  
    if(!is.character(vars)) {
      stop("vars must be characters only, please try again!")
    }
    
    interest_variables <- c("STG", "PEG")
    df |>
    dplyr::select(all_of(interest_variables))
}