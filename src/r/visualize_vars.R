#' Visualize a df with two specified variables and an optional alpha value\
#'
#' @param df A data frame or extension of it
#' @param x A numeric variable shown on x-axis
#' @param y A numeric variable shown on y-axis
#' @param alpha alplha number to specify
#'
#' @return ggplot point graph of two variables from same df 
#' @export
#'
#' @examples
#' visualize_vars(df, STF,PEG)
#' visualize_vars(mtcars, mpg, cyl)
#' visualize_vars(data.frame(x = 1, y =2), x,y)
visualize_vars <- function(df, x, y, alpha) {
  if (!is.data.frame(df)) {
    stop("df should be a data frame or data frame extension")
  } 
  else if (!is.numeric(dplyr::pull(df, {{x}} )) |
           !is.numeric(dplyr::pull(df, {{y}})) ) {
    stop("x and y should be of type numeric")
  }

  xlab <- deparse(substitute(x))
  ylab <- deparse(substitute(y))
  df |> 
    ggplot2::ggplot(aes({{x}}, {{y}})) +
    ggplot2::geom_point(alpha = alpha) +
    labs(x = xlab, y = ylab, title = paste(xlab, "vs", 
                                     ylab)) + 
    theme(text = element_text(size = 15))
}