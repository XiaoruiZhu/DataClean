# Writing a function to get information from "html" files.

###################################################################

### read in the field.html file into R

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

  ## ans <- getNodeSet(root, '//body//div[@class="field-value"]')
  ans <- getNodeSet(root, '//body//div')

  answers <- sapply(ans, xmlValue) ### Just get those text answers, image lost
  ### image saving!!!!!!
  answers2 <- getNodeSet(root, '//body//div[@class="field-value"]//img[@src]')
  answerimage <- sapply(answers2, function(els) xmlGetAttr(els, "src"))
  if (length(answerimage)>=1) {
    image <- answerimage[1] }
  else {
    image <- "No Image data"}
  list(IDS = ID, Answers = answers, Image = image)
}

## Test staff
## aaa <- as.character(mylist[2])
## try02 <- htmlParse(aaa)
## try02
## trytree <- htmlTreeParse(aaa)
## trytree


## QandA <- shoetower(mylist[2])
## No need to
## QandA$Answers[9]
## iconv(QandA$Answers[9],"UTF-8","")

## Now, what I need to do is to rearrage the structure of these four questions
