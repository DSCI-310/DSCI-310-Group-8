library(testthat)
source("../../tests/testthat/helper-load_data.r")

test_that("Path should be a string", {
    expect_error(load_data(dest_wr1, 2, test_var))
    expect_error(load_data(dest_wr2, 2, test_var))
    expect_error(load_data(dest_wr3, 2, test_var))
})

test_that("Sheet should be numeric", {
    expect_error(load_data(test_dest, sheet_wr1, test_var))
    expect_error(load_data(test_dest, sheet_wr2, test_var))
})

test_that("Column names should be unquoted strings", {
    expect_error(load_data(test_dest, 2, col_wr1))
    expect_error(load_data(test_dest, 2, col_wr2))
    expect_error(load_data(test_dest, 2, "STG"))
})