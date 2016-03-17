#' "htmltodata" function is used to transfer information from html files to R or exls files
#'
#' @title htmltodata
#'
#' @param path is the path of the file that you want to import into R and then export.
#'
#' @import XML
#' @return
#' @author Xiaorui(Jeremy) Zhu
#' @export
#'
#' @examples
htmltodata <- function(path){
  ### filetest <- "submitter8087/submission1941/fields.html" ### Doesn't need it
  ###    filetest
  ## try to change the path into characters
  cha.path <- as.character(path)
  ### Use XML package to transfer html file into text
  root <- htmlParse(cha.path)

  ### use getNodeSet to find right position of answers.
  getTitle <- getNodeSet(root, '//head//title')

  ### here for the file title
  title <- sapply(getTitle, xmlValue)

  values <- getNodeSet(root, '//body//div')

  text_values <- sapply(values, xmlValue) ### Just get those text answers, image lost
  ### image saving!!!!!!
  image_path <- getNodeSet(root, '//body//div[@class="field-value"]//img[@src]')
  image_saved_path <- sapply(image_path, function(els) xmlGetAttr(els, "src"))
  if (length(image_saved_path)>=1) {
    image <- paste(image_saved_path, sep = '') }
  else {
    image <- "No Image data"}
  list(title = title, text_values = text_values, Image_path = image)
}

