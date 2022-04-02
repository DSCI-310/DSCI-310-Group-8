library(testthat)
source("../src/tests/testthat/helper-num_na.r")

test_that("df should be a dataframe", {
    expect_error(num_na(df_wr1, stg))
    expect_error(num_na(df_wr2, stg))
})

test_that("`num_na` should produce numeric answer", {
     expect_type(num_na(df,cols[1]), "integer")
     expect_type(num_na(df,cols[2]), "integer")
     expect_type(num_na(df,cols[3]), "integer")
     expect_type(num_na(df,cols[4]), "integer")
     expect_type(num_na(df,cols[5]), "integer")
     expect_type(num_na(df,cols[6]), "integer")
     expect_type(num_na(df,cols[7]), "integer")
})

test_that("`num_na should produce 0 in our project as it was complete", {
    expect_equal(num_na(df, cols[1]), 0)
    expect_equal(num_na(df, cols[2]), 0)
    expect_equal(num_na(df, cols[3]), 0)
    expect_equal(num_na(df, cols[4]), 0)
    expect_equal(num_na(df, cols[5]), 0)
    expect_equal(num_na(df, cols[6]), 0)
    expect_equal(num_na(df, cols[7]), 0)
})



