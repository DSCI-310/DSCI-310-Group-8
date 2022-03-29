# Inputs for tests for visualize_vars.R
df_wr1 <- 2
df_wr2 <- "s"
x_wr1 <- "a"
x_wr2 <- data.frame(x = "a")
y_wr1 <- "v"
y_wr2 <- data.frame(y = "v")
test_df <- data.frame(len = c(25,36), wid = c(22, 10))
test_x <- "len"
test_y <- "wid"
xlab <- deparse(substitute(x))
ylab <- deparse(substitute(y))

# output for tests for visualize_var
test_output <- test_df |> 
    ggplot2::ggpairs()+
    theme_bw()

