##' This is a function that can be used to merger xlsx file using identified variables.
##'
##' This function need three parameters. First is name of the original file that contains original data. Second is name of file that need to be merged. Third is the identifiable variable name that in both files.
##'
##' @title A function to merger xlsx files by a same variable.
##'
##' @param original_file The name of original file. This file contains all original data. It should be a "xlsx" file and saved in the same working folder. This input must be a character string of file name if it is saved in working directory, or it should include saving path of file.
##' @param addin_file The file that need to be merged. It should be "xlsx" file and saved in the same working folder.
##' @param mergeID The merger variable name in both files. The variable name should be same in two files.
##' @references Author's Github https://github.com/XiaoruiZhu. If you have trouble with rJava or xlsx, please check http://stackoverflow.com/questions/7019912/using-the-rjava-package-on-win7-64-bit-with-r for further information to fix it.
##' @importFrom xlsx read.xlsx2
##' @importFrom tools file_ext
##' @return Return data are all original data with addin variables.
##' @author Xiaorui (Jeremy) Zhu
##' @export
##' @examples
##' file1 <- system.file("tests", "test_import1.xlsx", package = "DataClean")
##' file2 <- system.file("tests", "test_import2.xlsx", package = "DataClean")
##' # merge two xlsx files by id
##' Merged <- MergerXLSX(original_file=file1, addin_file=file2, mergeID = "user_id")
##' head(Merged)
MergerXLSX <- function(original_file, addin_file, mergeID){
  if (missing(original_file) | missing(addin_file)) {
    stop("Two 'files' must be a character string of name if it is saved in working directory, or it should include saving path of file.")
  }
  if (file_ext(original_file) != "xlsx" | file_ext(addin_file) != "xlsx")
  {
    stop("Please check the format of files. They should be 'xlsx' file. If not, change them then try again.")
  }
  original <- read.xlsx2(original_file, 1)
  addin <- read.xlsx2(addin_file, 1)
  if (sum(names(original)==mergeID)==0){
    stop("No same column name in either file. Please double check same ID name appears in both xlsx files.")
  } else {
    sub.list <- split(original, rownames(original))
    results <- lapply(sub.list, consolida, data = addin, mergeVar = mergeID)
    combined <- do.call(rbind.data.frame, results)
    return(combined)
  }
}
