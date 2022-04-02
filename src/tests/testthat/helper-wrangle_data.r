# Inputs for tests for wrangle_data
df_wr1 <- "a"
df_wr2 <- 1
vars_wr1 <- 1
test_vars <- c("STG", "PEG")
test_dest <- "../data/raw/student_performance.xls"
test_df <- suppressMessages(read_excel(test_dest, sheet = 3))
train_df <- suppressMessages(read_excel(test_dest, sheet = 2))



# outputs for wrangle_data

ex_test <- test_df |> select(STG,PEG)
ex_train <- train_df |> select(STG,PEG)
