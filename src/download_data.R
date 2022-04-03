# author: Isabela Lucas Bruxellas, Tony Liang
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
main <- function(url, file_path) {
    fun <- str_split(file_path, "/")
    path <- paste0(fun[[1]][1], "/", fun[[1]][2])
    file <- fun[[1]][3]
    if(!dir.exists(path)) {
        dir.create(path, 
                   )
    }
data <- download.file(url,paste0(path, "/",file))

}
main(opt[["--url"]],opt[["--file_path"]])


