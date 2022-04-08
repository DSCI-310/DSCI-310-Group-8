# author Anam HIra, Tony Liang 
# date: 2022-03-28

"Script to create exploratory data visualisations and tables that are useful to help the consumer understand the dataset.

Usage: data_visualisation.r --df=<df> --out_dir=<out_dir>

Options:
        --df=<df>     Path (including filename) to training data
        --out_dir=<out_dir> Path to directory where the plots should be saved
        " -> doc
library(tidyverse)
library(repr)
library(tidymodels)
library(readxl)
library(cowplot)
library(GGally)
library(broom)
library(rlang)
library(docopt)
devtools::install_github("DSCI-310/DSCI-310-Group-8-package", force = TRUE)
library(group8)

opt <- docopt(doc)

main <- function(df,out_dir) {
    if (!dir.exists(out_dir)) {
        dir.create(out_dir)
  }

    data_training <- read_csv(df)
    # Mean  
    user_means <- group8::summary_fun(data_training,mean)
    readr::write_csv(user_means, paste0(out_dir, "/means.csv"))
    
    # Max
    maximum <- group8::summary_fun(data_training, max)
    readr::write_csv(maximum,
            paste0(out_dir, "/maximum.csv"))
    # Min        
    minimum <- group8::summary_fun(data_training, min)
    readr::write_csv(minimum,
            paste0(out_dir, "/minimum.csv"))

    # Obs    
    observations <- data_training %>%
    summarize(n = n())
    readr::write_csv(observations,
            paste0(out_dir, "/observations.csv"))

    peg_stg <- group8::visualize_vars(data_training, STG, PEG, alpha = 0.4)
    
    ggplot2::ggsave("peg_stg.png", device = "png", path = out_dir, width = 5, height = 4)
}

main(opt[["--df"]], opt[["--out_dir"]])