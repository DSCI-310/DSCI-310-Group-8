library(testthat)
source("../src/tests/testthat/helper-load_data.r")

test_that("Path should be a string", {
    expect_error(load_data(dest_wr1, 2, 2))
    expect_error(load_data(dest_wr2, 2, 2))
    expect_error(load_data(dest_wr3, 2, 2))
})

test_that("Sheet should be numeric", {
    expect_error(load_data(test_dest, sheet_wr1, 2))
    expect_error(load_data(test_dest, sheet_wr2, 2))
})

test_that("`load_data` should return a data frame", {
    expect_s3_class(load_data(test_dest, 2, 2), "data.frame")
    expect_s3_class(load_data(test_dest,2, cols[1]), "data.frame")
    expect_s3_class(load_data(test_dest,2, cols[2]), "data.frame")
    expect_s3_class(load_data(test_dest,2, cols[3]), "data.frame")
    expect_s3_class(load_data(test_dest,2, cols[4]), "data.frame")
    expect_s3_class(load_data(test_dest,2, cols[5]), "data.frame")
    expect_s3_class(load_data(test_dest,3, cols[1]), "data.frame")
    expect_s3_class(load_data(test_dest,3, cols[2]), "data.frame")
    expect_s3_class(load_data(test_dest,3, cols[3]), "data.frame")
    expect_s3_class(load_data(test_dest,3, cols[4]), "data.frame")
    expect_s3_class(load_data(test_dest,3, cols[5]), "data.frame")
})

