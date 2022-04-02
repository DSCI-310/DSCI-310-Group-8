library(testthat)
source("../src/tests/testthat/helper-summary_fun.r")

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

test_that("`summary_fun` returns a data frame", {
    expect_s3_class(summary_fun(df,test_fun), "data.frame")
    expect_s3_class(summary_fun(df, sd), "data.frame")
    expect_s3_class(summary_fun(df, var), "data.frame")
    expect_s3_class(summary_fun(df2,test_fun), "data.frame")
    expect_s3_class(summary_fun(df2, sd), "data.frame")
    expect_s3_class(summary_fun(df2, var), "data.frame")
})

test_that("`summary_fun` should be a single statistic of the variable", {
   expect_equivalent(colnames(summary_fun(df, test_fun)) , c("lens"))
   expect_equivalent(colnames(summary_fun(df2, test_fun)) , c("l", "w"))
})

test_that("`summarize_fun` should return an empty data frame, if input is an empty data frame", {
  expect_equivalent(summary_fun(empty_df, mean), empty_df_output)
})

test_that("`summarize_col` should correctly calculate fun implemented in base R", {
   expect_equivalent(summary_fun(df, test_fun), ex_df)
   expect_equivalent(summary_fun(df2, test_fun), ex_df2)
})


