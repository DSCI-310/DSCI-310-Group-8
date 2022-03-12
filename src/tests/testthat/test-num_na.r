library(testthat)
source("../../tests/testthat/helper_num_na.r")

test_that("df should be a dataframe", {
    expect_error(num_na(df_wr1, test_var))
    expect_error(num_na(df_wr2, test_var))
})

test_that("var should not be numeric or dataframe or character with quotes", {
    expect_error(num_na(df, var_wr1))
    expect_error(num_na(df, var_wr2))
    expect_error(num_na(df, var_wr3))
})
