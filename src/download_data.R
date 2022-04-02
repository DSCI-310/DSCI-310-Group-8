# author: Isabela Lucas Bruxellas
# date: 2022-03-24

"This script downloads the data from the internet and saves it locally.

Usage: download_data.R --url=<url> --file_path=<file_path> 

Options:
    --url=<url>               Url to download data
    --file_path=<file_path>   Path to the data file
    " -> doc

library(tidyverse)
library(docopt)

opt <- docopt(doc)

data <- download.file(opt$url,opt$file_path)

print(data)
print(opt)

