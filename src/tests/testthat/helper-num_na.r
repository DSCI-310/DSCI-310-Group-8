# Inputs for tests of num_na
df_wr1 <- 12
df_wr2 <- "abc"
var_wr1 <- 1231
var_wr2 <- data.frame(var = 1)
var_wr3 <- "hello"
test_dest <- "../data/raw/student_performance.xls"
df <- read_excel(test_dest, sheet = 2)
stg <- df |> select(STG) |> pull()

