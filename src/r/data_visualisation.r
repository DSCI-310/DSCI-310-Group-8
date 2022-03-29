#'Function to create exploratory data visualisations and tables that 
#' 
#' @param data frame or extension of data
#' @param theme that you want to specify
#'
#' @return The correlation table for the variables within the data
#' @export
#'
#' @examples
#' data_visualisation(data_1)
#' data_visualisation(data_2)
#' 
data_visualisation <- function(df,results) {

    if (!is.data.frame((df))) {
        stop("df should be a data frame or data frame extension")
    }


    df |>
        ggplot2::ggpairs()+
        theme_bw()

    
}