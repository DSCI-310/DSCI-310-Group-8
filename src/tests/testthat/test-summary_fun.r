library(testthat)
source("../../tests/testthat/helper-summary_fun.r")

test_that("df should be a dataframe", {
    expect_error(summary_fun(df_wr1, test_fun))
    expect_error(summary_fun(df_wr2, test_fun))
})

test_that("fun should be a function only", {
    expect_error(summary_fun(df, fun_wr1))
    expect_error(summary_fun(df, fun_wr2))
    expect_error(summary_fun(df, fun_wr3))
    expect_error(summary_fun(df, fun_wr4))
})

