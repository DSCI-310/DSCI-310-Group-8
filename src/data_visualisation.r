# author Anam HIra
# date: 2022-03-28

"Scriptt to create exploratory data visualisations and tables that are useful
to help the consumer understand the dataset"

"Usage src/data_visualisation.r --train=<train> --out_dir=<out_dir>"
#' 
#' @param data frame or extension of data
#' @param theme that you want to specify
#'
#' @return The correlation table for the variables within the data
#' @export
#'

#' 
#' 

"Options:
--df=<df>     Path (including filename) to training data
--results=<results> Path to directory where the plots should be saved"
library(tidyverse)
library(docopt)
library(ggthemes)
library(ggplot2)

opt <- docopt(doc)
main <- function(df,results) {
    
    train_data <- read_feather(train) %>% 
    ggpairs() +
    theme_bw
    ggsave(paste0(results, "/pair_comparison.png"), 
         df,
         width = 8, 
         height = 10)
}



main(opt[["--df"]], opt[["--results"]])