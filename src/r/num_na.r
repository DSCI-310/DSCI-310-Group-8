#' counts number of na values of a variable in a df
#' 
#' @param df A data frame or its extension
#' @param variable name to count
#'
#' @return A number of how many na values there contain in the variable
#' @export
#'
#' @examples
#' num_na(user_training, STG)
#' num_na(user_testing, PEG)
#' num_na(user_training, STG)
num_na <- function(df, var) {
    if (!is.data.frame(df)) {
        stop("Df must be a dataframe only")
    }
    
    df2 <- df |> dplyr::select({{var}})

    sum(is.na(df2))
}
