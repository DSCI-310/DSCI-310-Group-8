library(testthat)


test_that("Df should be a data frame", {
    expect_s3_class(mtcars, "data.frame")
    expect_error(num_na(0, mpg))
    expect_error(num_na("empty", mpg))
    expect_error(num_na(TRUE, mpg))
})

test_that("Output is an integer", {
    expect_type(num_na(mtcars, mpg), "integer")
    expect_type(num_na(mtcars, cyl), "integer")
    expect_type(num_na(mtcars, disp), "integer")
})

test_that("Ouput should be correct", {
    expect_equal(num_na(mtcars, mpg),0)
})

test_that("Var does not exist", {
    expect_error(num_na(mtcars, dne))
})

test_that("Var should be one variable only", {
    expect_error(num_na(mtcars, c("mpg", "disp")))
    expect_error(num_na(mtcars, seq(1:20)))
})
