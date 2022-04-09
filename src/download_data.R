# author: Isabela Lucas Bruxellas, Tony Liang
# date: 2022-03-24

"This script downloads the data from the internet and saves it locally.

Usage: src/download_data.R --url=<url> --out_dir=<out_dir>

Options:
    --url=<url>               Url to download data
    --out_dir=<out_dir>       Path of where to save the data
    " -> doc

library(tidyverse)
library(docopt)

set.seed(123)
opt <- docopt(doc)
main <- function(url, out_dir) {
    fun <- stringr::str_split(out_dir, "/")
    path <- paste0(fun[[1]][1], "/", fun[[1]][2])
    file <- fun[[1]][3]
    if(!dir.exists(path)) {
        dir.create(path, recursive = TRUE)
    }

download.file(url,paste0(path, "/",file), mode = "wb")

}
main(opt[["--url"]],opt[["--out_dir"]])


