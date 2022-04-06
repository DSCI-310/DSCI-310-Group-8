# author: Isabela Lucas Bruxellas, Tony Liang
# date: 2022-03-24

"Accesses the dataset downloaded in the first script. Reads the second and third sheets of the dataset and selects only the numeric 
columns.  Creates training using the selected data from sheet 2 and a user-inputted target variable. The function automatically 
identifieds the variable with the highest correlation to the target variable. Training data selects only the column of the target 
variable and of the variable with the highest correlation to it. Creates testing data selecting only numeric columns from the third 
sheet and selecting only the relevant columns determined for training data.

Usage: src/prepare_data.R --file_path=<file_path> --target_value=<target_value> --dest_path=<dest_path>

Options:
    --file_path=<file_path>   Path to the data file
    --target_value=<target_value>   Column number of the analysis variable. This is the variable for which you are trying to determine its highest correlation second variable so that you can filter the data to only those two columns.
    --dest_path=<dest_path> Path to store processed data
    
    " -> doc

library(tidyverse)
library(docopt)
library(dplyr)
library(gdata)
library(GGally)
library(reshape)


opt <- docopt(doc)
get_data <- function (file_path, sheet_index) {
    gdata::read.xls(xls=file_path, sheet=sheet_index) %>%
        dplyr::select(where(is.numeric))
}

list_cor <- function(matrix_data, target_value) {
    result <- list()
    n <- hyperSpec::ncol(matrix_data)
    N <- 1:n
    for (i in seq_along(N)){
        if (i != target_value) {
            cor.result <- stats::cor.test(matrix_data[, target_value], matrix_data[, i])
            estimate <- cor.result$estimate
            result <- append(result, estimate)   
        } else {
            result <- append(result, 0)
        }
    }
    return(result)
}

highest_cor <- function(matrix_data, target_value) {
    result <- list_cor(matrix_data, target_value) 
    n <- ncol(matrix_data)
    N <- 1:n
    cor <- 0 
    for (c in result){
        if (c > cor){
            cor <- c
        }
    }
    return(match(cor, result))
}

assert_data <- function(matrix_data, result, target_value){
    asserted_data <- matrix_data %>%
        select(result, target_value)
    return (asserted_data)     
}

main_training <- function(file_path, target_value, dest_path){
     if (!dir.exists(dest_path)) {
        dir.create(file.path(c:data, processed, recursive = TRUE))
     } 
    data_training_raw <- get_data(file_path, 2)
    result <- highest_cor(data_training_raw, target_value)
    data_training <- assert_data(data_training_raw, result, target_value)
    data_train_write <- utils::write.csv(data_training, paste0(dest_path, "/train_data.csv"))
    return (data_train_write)
}

main_testing <- function(file_path, target_value, dest_path){
     if (!dir.exists(dest_path)) {
        dir.create(file.path(c:data, processed, recursive = TRUE))
     } 
    
    data_training_raw <- get_data(file_path, 2)
    data_testing_raw <- get_data(file_path, 3)
    result <- highest_cor(data_training_raw, target_value)
    data_testing <- assert_data(data_testing_raw, result, target_value)
    data_test_write <- utils::write.csv(data_testing, paste0(dest_path, "/test_data.csv"))
    return (data_test_write)
}

main_training(opt["--file_path"], opt["--target_value"], opt["--dest_path"])
main_testing(opt["--file_path"], opt["--target_value"], opt["--dest_path"])