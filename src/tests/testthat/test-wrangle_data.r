library(testthat)
source("../src/tests/testthat/helper-wrangle_data.r")

test_that("df should be a dataframe", {
    expect_error(wrangle_data(df_wr1))
    expect_error(wrangle_data(df_wr2))
})

test_that("`wrangle_data` returns a dataframe", {
   expect_s3_class(wrangle_data(df), "data.frame")
})

test_that("`wrangle_data` is returning correct dimension of data", {
    expect_equivalent(ncol(wrangle_data(df)), 2)
})