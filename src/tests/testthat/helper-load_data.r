# inputs for tests for load_data
sheet_wr1 <- "sd"
sheet_wr2 <- c("hello")
dest_wr1 <- 454
dest_wr2 <- c("s", "c")
dest_wr3 <- data.frame(al = "s", num = 4)
col_wr1 <- "a"
col_wr2 <- c(1,2,3)
test_sheet <- 2
test_dest <- "../data/raw/student_performance.xls"
# expected output for load_data
stg_output <- read_excel(test_dest, sheet = 2) |> select(STG)

