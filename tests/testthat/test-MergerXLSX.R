library(DataClean)
context("MergerXLSX")

test_that("import files are not empty", {
  expect_match(length(system.file("tests", package = "DataClean")), "test_import1.xlsx")
})
