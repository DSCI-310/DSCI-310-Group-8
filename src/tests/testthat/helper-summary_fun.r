# Inputs for tests for summary_fun
df_wr1 <- 1
df_wr2 <- "a"
fun_wr1 <- 2
fun_wr2 <- "3"
fun_wr3 <- data.frame(v = 1)
fun_wr4 <- c("1sd", "aaa")
test_fun <- mean
df = data.frame(lens = c(1,2,3))
df2 = data.frame(l = c(1,2,3) , w = c(3,3,3))
empty_df  <- data.frame(x = numeric(0), y = numeric(0))

# outputs for tests for summary_fun
ex_df <- data.frame(lens = 2)
ex_df2 <- data.frame(l = 2 , w = 3)
empty_df_output <- data.frame(mean = numeric(0))

