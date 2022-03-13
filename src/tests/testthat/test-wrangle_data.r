library(testthat)
source("../src/tests/testthat/helper-wrangle_data.r")

test_that("df should be a dataframe", {
    expect_error(wrangle_data(df_wr1))
    expect_error(wrangle_data(df_wr2))
})

test_that("`wrangle_data` returns a dataframe", {
   expect_s3_class(wrangle_data(test_df), "data.frame")
})

test_that("`wrangle_data` is returning correct dimension of data", {
    expect_equivalent(ncol(wrangle_data(test_df)), 2)
})

test_that("`wrangle_data` column names contains STG and PEG only",{
    expect_equivalent(colnames(wrangle_data(test_df)), test_vars)
    expect_equivalent(colnames(wrangle_data(train_df)), test_vars)
})

test_that("`wrangle_data` selects STG and PEG data", {
    expect_equivalent(wrangle_data(test_df), ex_test)
    expect_equivalent(wrangle_data(train_df), ex_train)
} )
