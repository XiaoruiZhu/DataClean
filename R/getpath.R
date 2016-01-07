rm(list=ls())
all.files <- list.files(path ="Z:/zhuxiaorui/Dropbox/assessment9/", full.names = T)
all.files <- all.files[-1]
all.files[1:10]

#' Title getpath function
#'
#' @param up.path is the path of the folder that saved all files.
#'
#' @return The whole paths of individual files were saved as a list.
#' @export
#'
#' @examples
getpath <- function(up.path){
  af.under <- list.files(path = up.path, full.names = F)
  whole.path <- paste(up.path,af.under, "fields.html", sep="/")
  return(whole.path)
}
all.files[1:10]
mylist <- lapply(all.files, getpath)
mylist[1:2]

### mydata <- do.call('rbind',mylist)
