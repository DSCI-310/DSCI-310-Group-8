library(testthat)

test_that("df should be a dataframe", {
    expect_error(wrangle_data(0))
    expect_error(wrangle_data("abc"))
    expect_error(wrangle_data(seq(1,10)))
})

test_that("`wrangle_data` returns a dataframe", {
    expect_s3_class(wrangle_data(mtcars, mpg, disp), "data.frame")
    expect_s3_class(wrangle_data(mtcars, mpg), "data.frame")
})

test_that("`wrangle_data` is returning correct dimension of data", {
    expect_equal(ncol(wrangle_data(mtcars, mpg)), 1)
    expect_equal(ncol(wrangle_data(mtcars, mpg, disp)), 2)
})

test_that("`wrangle_data` column names contains input variables only",{
    expect_equal(colnames(wrangle_data(mtcars, mpg)), c("mpg"))
})
