num_na <- function(df, var) {
    if (!is.data.frame(df)) {
        stop("Df must be a dataframe only")
    }
    
    df2 <- df |> dplyr::select({{var}})
    sum(is.na(df2))
}
