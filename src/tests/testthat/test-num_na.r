library(testthat)
source("../src/tests/testthat/helper-num_na.r")

test_that("df should be a dataframe", {
    expect_error(num_na(df_wr1, stg))
    expect_error(num_na(df_wr2, stg))
})



