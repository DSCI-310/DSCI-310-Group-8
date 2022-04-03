# author Anam HIra , Tony Liang
# date: 2022-03-28

"Script that reads data from the second script and performs the modelling and saves the figures.

Usage: src/summary_script.R --user_training=<training> --user_testing==<testing> --results=<results>

Options:
-user_training=<training>     Path (including filename) to training data
-user_testing=<testing>     Path (including filename) to testing data
--results=<results> Path to directory where the plots should be saved" -> doc
library(tidyverse)
library(docopt)
library(digest)
library(repr)
library(tidymodels)
library(readxl)
library(cowplot)
library(GGally)
library(broom)
library(rlang)
library(testthat)
options(repr.matrix.max.rows = 6)
source("src/R/visualize_vars.R")

opt <- docopt(doc)
main <- function(user_training, user_testing,results) {
    
    if (!dir.exists(results)) {
    dir.create(results)
  }
    user_training <- read_csv(user_training) 
    user_testing <- read_csv(user_testing)
    lm_spec <- linear_reg() %>%
        set_engine("lm") %>%
        set_mode("regression")

    performance_recipe <- recipe(PEG~.,data=user_training)

    performance_fit <- workflow() %>%
    add_recipe(performance_recipe) %>%
    add_model(lm_spec) %>%
    fit(data = user_training)


    performance_fit

    lm_rmse <- performance_fit %>%
        predict(user_training) %>%
        bind_cols(user_training) %>%
        metrics(truth = PEG ,estimate = .pred) %>%
        filter(.metric == "rmse") %>%
        select(.estimate) %>%
        as.data.frame()
    lm_rmse
    readr::write_csv(lm_rmse,
            paste0(results, "/lm_rmse.csv"))
    lm_rmspe <- performance_fit %>%
        predict(user_testing) %>%
        bind_cols(user_testing) %>%
        metrics(truth = PEG ,estimate = .pred) %>%
        filter(.metric == "rmse") %>%
        select(.estimate) %>%
        as.data.frame()
    lm_rmspe
    readr::write_csv(lm_rmspe,
            paste0(results, "/lm_rmspe.csv"))

    performance_knn_recipe <- recipe(PEG ~., data = user_training) %>%
                        step_center(all_predictors()) %>%
                        step_scale(all_predictors())
    performance_knn_recipe

    performance_knn_spec <- nearest_neighbor(weight_func = "rectangular", neighbors = tune()) %>%
                      set_engine("kknn") %>%
                      set_mode("regression")
    
    performance_vfold <- vfold_cv(user_training, v = 5, strata = PEG)

    performance_knn_workflow <- workflow() %>%
                        add_recipe(performance_knn_recipe) %>%
                        add_model(performance_knn_spec)

    gridvals <- tibble(neighbors = seq(1,20))

    performance_knn_results <- performance_knn_workflow %>%
                       tune_grid(resamples = performance_vfold, grid = gridvals) %>%
                       collect_metrics()
    
    kmin <- performance_knn_results %>%
               filter(.metric == 'rmse') %>%
               filter(mean == min(mean))  %>% 
               pull(neighbors) %>%
               as.data.frame()
    kmin    
    readr::write_csv(kmin,
            paste0(results, "/kmin.csv"))

    performance_spec_knn <- nearest_neighbor(weight_func = "rectangular", neighbors = kmin) %>%
    set_engine("kknn") %>%
    set_mode("regression")

    performance_fit_knn <- workflow() %>%
    add_recipe(performance_knn_recipe) %>%
    add_model(performance_spec_knn) %>%
    fit(data = user_training)

    knn_rmse <- performance_fit_knn %>%
    predict(user_training) %>%
    bind_cols(user_training) %>%
    metrics(truth = PEG, estimate = .pred)%>%
    filter(.metric == 'rmse')  %>%
    as.data.frame()

    knn_rmse

    readr::write_csv(knn_rmse,
            paste0(results, "/knn_rmse.csv"))

    knn_rmspe <- performance_fit_knn %>%
    predict(user_testing) %>%
    bind_cols(user_testing) %>%
    metrics(truth = PEG, estimate = .pred)%>%
    filter(.metric == 'rmse') %>%
    as.data.frame()
    knn_rmspe

    readr::write_csv(knn_rmspe,
            paste0(results, "/knn_rmspe.csv"))


    lm_predictions <- user_training %>%
    ggplot(aes(x = STG, y = PEG)) +
        geom_point() +
        geom_smooth(method = "lm", se = FALSE) +
        xlab("Degree of study time") +
        ylab("Degree of student performance") +
        ggtitle("Linear regression fitting model between STG and PEG")+
        theme(text = element_text(size = 14))
    lm_predictions
    ggsave("lm_predictions.png",device="png", path="results/model", width=5, height=4 )

    knn_pred <- performance_fit_knn %>%
    predict(user_training) %>%
    bind_cols(user_training)

    knn_regression_plot <- visualize_vars(user_training, STG,PEG, alpha = 0.4) + 
                       geom_line(data = knn_pred,
                                 mapping = aes(x = STG, y = .pred),
                      color = "blue") +
                ggtitle("K-NN regression fitting model between STG and PEG")

    ggsave("knn_regression_plot.png",device="png", path="results/model", width=5, height=4 )

}   

main(opt[["--user_testing"]], opt[["--user_training"]], opt[["--results"]])
