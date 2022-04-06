# author Anam HIra, Tony Liang 
# date: 2022-03-28

"Script to create exploratory data visualisations and tables that are useful to help the consumer understand the dataset.

Usage: data_visualisation.r --df=<df> --out_dir=<out_dir>

Options:
        --df=<df>     Path (including filename) to training data
        --out_dir=<out_dir> Path to directory where the plots should be saved
        " -> doc
library(tidyverse)
library(digest)
library(repr)
library(tidymodels)
library(readxl)
library(cowplot)
library(GGally)
library(broom)
library(rlang)
library(docopt)


options(repr.matrix.max.rows = 6)
source("src/R/visualize_vars.R")
source("src/R/summary_fun.R")

opt <- docopt(doc)

main <- function(df,out_dir) {

    if (!dir.exists(out_dir)) {
        dir.create(out_dir)
  }
    data_training <- read_csv(df)
    user_means <- summary_fun(data_training,mean)
    readr::write_csv(user_means, paste0(out_dir, "/means.csv"))


    maximum <- summary_fun(data_training, max)
    maximum
    readr::write_csv(maximum,
            paste0(out_dir, "/maximum.csv"))
    minimum <- summary_fun(data_training, min)
    readr::write_csv(minimum,
            paste0(out_dir, "/minimum.csv"))

    observations <- data_training %>%
    summarize(n = n())
    readr::write_csv(observations,
            paste0(out_dir, "/observations.csv"))

    peg_stg <- visualize_vars(data_training, STG, PEG, alpha = 0.4)
    
    ggplot2::ggsave("peg_stg.png", device = "png", path = out_dir, width = 5, height = 4)
}

main(opt[["--df"]], opt[["--out_dir"]])