#' counts number of na values of a variable in a df
#'
#' @param df data frame or its extension
#' @param var  unquoted column/variable name to count number of NA values
#'
#' @return a number of how many na values there contain in the input var
#'
#' @export
#'
#' @examples
#' num_na(mtcars, mpg)
#' num_na(mtcars, cyl)
#' num_na(mtcars, disp)
num_na <- function(df, var) {
    if (!is.data.frame(df)) {
        stop("Df must be a dataframe only")
    } else if (!(deparse(substitute(var)) %in% colnames(df))){
        stop("Passed variable does not exist")
    } else {
        df2 <- df |> dplyr::select({{var}})
        
        sum(is.na(df2))
    }
}
