library(testthat)
source("../../tests/testthat/helper-wrangle_data.r")

test_that("df should be a dataframe", {
    expect_error(wrangle_data(df_wr1))
    expect_error(wrangle_data(df_wr2))
    expect_error(wrangle_data(df, vars = test_vars))
})

test_that("vars should be characters", {
    expect_error(wrangle_data(df, vars = vars_wr1))
})