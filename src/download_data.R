# author: Isabela Lucas Bruxellas
# date: 2022-03-24

"This script downloads the data from the internet and saves it locally.

Usage: download_data.R --url=<url> --file_path=<file_path> --file_name=<file_name>

Options:
    --url=<url>               Url to download data
    --file_path=<file_path>   Path to the data file
    --file_name=<file_name>   Name to call the file
    " -> doc

library(tidyverse)
library(docopt)

opt <- docopt(doc)

main <- function(url, file_path, file_name) {
if (!dir.exists(file_path)) {
    dir.create(file_path)
}    

data <- download.file(url,paste0(file_path, file_name))

}

main(opt[["--url"]], opt[["--file_path"]], opt[["--file_name"]])


