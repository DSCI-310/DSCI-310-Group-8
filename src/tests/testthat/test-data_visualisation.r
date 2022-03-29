library(testthat)
source("../src/tests/testthat/helper-data_visualisation.r")

test_that("df should be a dataframe", {
    expect_error(data_visualisation(df_wr1))
    expect_error(data_visualisation(df_wr2))
})


test_that("`visualize_vars` returns a ggplot object", {
    expect_s3_class(data_visualisation(test_df), class = "ggplot")
})

