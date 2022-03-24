# author: Isabela Lucas Bruxellas
# date: 2022-03-24

#This script downloads the data from the internet and saves it locally.

# Usage: Rscript download_data.R -> doc 

library(tidyverse)
library(docopt)

opt <- docopt(doc)

download.file("https://archive.ics.uci.edu/ml/machine-learning-databases/00257/Data_User_Modeling_Dataset_Hamdi%20Tolga%20KAHRAMAN.xls", '../Downloads/Data_User_Modeling_Dataset_Hamdi Tolga KAHRAMAN.xls')
