# author: Isabela Lucas Bruxellas
# date: 2022-03-24

"This script downloads the data from the internet and saves it locally.

Usage: Rscript download_data.R --url=<url> --file_path=<file_path> 

Options:
    --url=<url>               Url to download data
    --file_path=<file_path>   Path to the data file
    " -> doc

library(tidyverse)
library(docopt)

data <- download.file("https://archive.ics.uci.edu/ml/machine-learning-databases/00257/Data_User_Modeling_Dataset_Hamdi%20Tolga%20KAHRAMAN.xls","../Downloads/Data_User_Modeling_Dataset_Hamdi Tolga KAHRAMAN.xl" )

print (data)

