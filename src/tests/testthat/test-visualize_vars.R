library(testthat)
source("../src/tests/testthat/helper-visualize_vars.r")

test_that("df should be a dataframe", {
    expect_error(visualize_vars(df_wr1, test_x, test_x))
    expect_error(visualize_avars(df_wr2, test_x, test_x))
})

test_that("x and y should be numeric variables", {
    expect_error(visualize_vars(test_df, x_wr1, test_x))
    expect_error(visualize_vars(test_df, x_wr2, test_x))
    expect_error(visualize_vars(test_df, test_x, y_wr1))
    expect_error(visualize_vars(test_df, test_x, y_wr2))
})

test_that("`visualize_vars` returns a ggplot object", {
    expect_s3_class(visualize_vars(test_df,test_x,test_y), class = "ggplot")
})

#test_that("`visualize_vars` is returning correct output", {
#    expect_equivalent(visualize_vars(test_df, "len", "wid"), test_output)
#})