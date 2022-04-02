library(testthat)
df <- mtcars
empty_df  <- data.frame(x = numeric(0), y = numeric(0))
empty_df_output <- data.frame(mean = numeric(0))
cols <- colnames(mtcars)
mean_output <- data.frame(mpg = 20.1 , cyl = 6.2, disp = 230.7, hp = 146.7,
                          drat = 3.6, wt = 3.2, qsec = 17.8, vs = 0.4,
                          am = 0.4, gear = 3.7, carb = 2.8)
sd_output <- data.frame(mpg = 6 , cyl = 1.8, disp = 123.9, hp = 68.6,
                        drat = 0.5, wt = 1, qsec = 1.8, vs = 0.5,
                        am = 0.5, gear = 0.7, carb = 1.6)


# Tests
test_that("df should be a dataframe", {
  expect_error(summary_fun(0, mean))
  expect_error(summary_fun("null", sd))
})

test_that("fun should be a function only", {
  expect_error(summary_fun(df, 0))
  expect_error(summary_fun(df, "empty"))
  expect_error(summary_fun(df, seq(1,10)))
  expect_error(summary_fun(df, c("a","b")))
})

test_that("`summary_fun` returns a data frame", {
  expect_s3_class(summary_fun(df,mean), "data.frame")
  expect_s3_class(summary_fun(df, sd), "data.frame")
  expect_s3_class(summary_fun(df, var), "data.frame")
  expect_s3_class(summary_fun(df,mean), "data.frame")
})

test_that("`summary_fun` should be a single statistic of the variable", {
  expect_equal(colnames(summary_fun(df, mean)) , cols)
  expect_equal(colnames(summary_fun(df, sd)) , cols)
})

test_that("`summary_fun` should return an empty data frame, if input is an empty data frame", {
  expect_equal(summary_fun(empty_df, mean), empty_df_output)
})

test_that("`summary_fun` should correctly calculate fun implemented in base R",{
  expect_equal(data.frame(summary_fun(df, mean)), mean_output)
  expect_equal(data.frame(summary_fun(df, sd)), sd_output)
})
