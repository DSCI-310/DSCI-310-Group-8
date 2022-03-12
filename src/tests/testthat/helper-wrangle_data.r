# Inputs for tests for wrangle_data
df_wr1 <- "a"
df_wr2 <- 1
vars_wr1 <- 1
test_vars <- c("SCG", "STR")
test_dest <- "../data/raw/student_performance.xls"
df <- read_excel(test_dest, 2)

# outputs for wrangle_data