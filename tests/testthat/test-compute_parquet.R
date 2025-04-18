test_that("compute_parquet()", {
  df <- data.frame(x = c(1, 2))
  withr::defer(unlink("test.parquet"))
  out <- compute_parquet(df, path = "test.parquet")

  expect_identical(out, as_duckdb_tibble(df))
  expect_false(is_prudent_duckplyr_df(out))
})

test_that("compute_parquet() with options", {
  df <- data.frame(x = c(1, 2), a = c("a", "b"))
  withr::defer(unlink("test", recursive = TRUE))
  dir.create("test")
  out <- compute_parquet(df, path = "test", options = list(partition_by = "a"))

  expect_identical(out, as_duckdb_tibble(df))
  expect_false(is_prudent_duckplyr_df(out))
})
