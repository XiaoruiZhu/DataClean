library(DataClean)
context("MergerXLSX")

test_that("Missing files", {
  expect_error(MergerXLSX(original_file=NA, addin_file=NA, mergeID = "user_id"))
})
