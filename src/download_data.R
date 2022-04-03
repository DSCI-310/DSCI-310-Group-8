# author: Isabela Lucas Bruxellas
# date: 2022-03-24

"This script downloads the data from the internet and saves it locally.

Usage: src/download_data.R --url=<url> --out_dir=<out_dir>

Options:
    --url=<url>               Url to download data
    --out_dir=<out_dir>       Path of where to save the data
    " -> doc

library(tidyverse)
library(docopt)

opt <- docopt(doc)

download.file(opt$url, opt$out_dir)


