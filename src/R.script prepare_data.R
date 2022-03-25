# author: Isabela Lucas Bruxellas
# date: 2022-03-24

"Accesses the dataset downloaded in the first script. Reads the second and third sheets of the dataset and selects only the numeric 
columns.  Creates training using the selected data from sheet 2 and a user-inputted target variable. The function automatically 
identifieds the variable with the highest correlation to the target variable. Training data selects only the column of the target variable and of the variable
with the highest correlation to it. Creates testing data selecting only numeric columns from the third sheet.

Usage: prepare_data.R" -> doc


library(tidyverse)
library(docopt)
library(dplyr)
library (gdata)
library (GGally)
library(reshape)

opt <- docopt(doc)

data_sheet_2 <- read.xls(xls='../Downloads/Data_User_Modeling_Dataset_Hamdi Tolga KAHRAMAN.xls', sheet=2) %>%
    dplyr::select(where(is.numeric))

data_sheet_3 <- read.xls(xls='../Downloads/Data_User_Modeling_Dataset_Hamdi Tolga KAHRAMAN.xls', sheet=3) %>%
    dplyr::select(where(is.numeric))

list_res <- function(matrix_data, target_value) {
    result <- list()
    n <- ncol(matrix_data)
    N <- 1:n
    for (i in seq_along(N)){
        if (i != target_value) {
            cor.result <- cor.test(matrix_data[, target_value], matrix_data[, i])
            estimate <- cor.result$estimate
            result <- append(result, estimate)   
        } else {
            result <- append(result, 0)
        }
    }
    return(result)
}

highest_cor <- function(matrix_data, target_value) {
    result <- list_res(matrix_data, target_value) 
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

training_data <- function(matrix_data, target_value){
    result <- highest_cor(matrix_data, target_value)
    data_sheet_2 %>%
        select(result, target_value)    
}

print(training_data(data_sheet_2, 5))

testing_data <- function(matrix_data, target_value){
    result <- highest_cor(matrix_data, target_value)
    data_sheet_3 %>%
        select(result, target_value)    
}

print (testing_data(data_sheet_3, data_sheet_2, 5))


