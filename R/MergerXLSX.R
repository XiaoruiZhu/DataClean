##' This is a function that can be used to merger xlsx file using identified variables.
##'
##' This function need three parameters. First is the name of the file with which need to be merged. Second is the name of original file that contains data. Third is the identifiable variable name that in both files.
##'
##' @title MergerXLSX is a function to merger of xlsx files by identified variable.
##'
##' @param original_file is the name of original file. This file contains all original data. This file should be "xlsx" file and save in the same folder.
##' @param addin_file is the file that need to be merged. This file should be "xlsx" file and save in the same folder.
##' @param mergeID is the merger variable name in both files.
##'
##' @importFrom xlsx read.xlsx2
##' @return Return data are all original data with addin variables.
##' @author Xiaorui.Zhu
##' @export
MergerXLSX <-
  function(original_file, addin_file, mergeID){
    ## library(xlsx) just try the following:
    original <- read.xlsx2(original_file, 1)
    addin <- read.xlsx2(addin_file, 1)
    sub.list <- split(original, rownames(original))
    results <- lapply(sub.list, consolida, data = addin, mergeVar = mergeID)
    combined <- do.call(rbind.data.frame, results)
    return(combined)
  }
