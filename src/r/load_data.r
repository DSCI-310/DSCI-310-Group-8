#' Loads a new data frame with selected columns
#'
#' @param path A path (String) that leads to the file
#' @param sheet number of the sheet to be read
#' @param ... column Name(s) that needs to be loaded into the data frame
#'
#' @return A data frame with cols specified
#' @export
#'
#' @examples
#' load_data("data/student_perfomance.xls",2, STG, SCG,STR)
#' load_data("data/data.xls, 1, 1,2,3)
#' load_data("data/data.xls, 2 , 1:3)
load_data <- function(path, sheet, ...) {
   if (!is.character(path)) {
     stop("Path must be a string! Please try again.")
   }
  
   if (!is.numeric(sheet)) {
     stop("Sheet must be a number! Please try again.")
    }
    
    cols <- enquos(...)
    read_excel(path, sheet) |>
    dplyr::select(!!!cols)
}