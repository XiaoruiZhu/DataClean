setwd('Y:/PH.D/Fields/R_packages/DataClean/')  # 先把工作目录切换到pkg之上

Sys.setenv(JAVA_HOME='C:\\Program Files (x86)\\Java\\jre1.8.0_66') # for 64-bit version
# library(rJava)
library(xlsx)

###########################################################
# Testing sections
# Testing MergerXLSX function

submitters <- read.xlsx2("Y:/PH.D/PSU/Part-time job/MOOC/Attempts/1278samples_Ques(test).xlsx", 1)
head(submitters)

outfile <- MergerXLSX(original_file = "submitter.xlsx", addin_file = "Demo.xlsx", mergeID = "Coursera_UserID")

length(outfile[,1])
head(outfile)
write.xlsx2(x = outfile, file = "MergerTest.xlsx", sheetName = "submitter", row.names = FALSE)

# End test

# Testing getpath function
#
all.files <- getSfilesPath(root.path ="Z:/zhuxiaorui/Dropbox/assessment9/", filename = "fields.html")
all.files[1:10]
length(all.files)

# End test

# Testing htmltodata function
#
library(XML)
# In mac
setwd('/Users/JeremyZhu/Documents/R Packages/DataClean/Data/')  # 先把工作目录切换到pkg之上

path <- "fields.html"

cha.path <- as.character(path)

### Use XML package to transfer html file into text

root <- htmlParse(cha.path)
root
getIDs <- getNodeSet(root, '//head//title')
getIDs
testID <- sapply(getIDs, xmlValue)
testID
test <- htmltodata(cha.path)
test

# This part is used to test
doc = xmlRoot(htmlTreeParse("R SVM.html"))

function(node)
  xmlSApply(node, xmlValue)

xmlSApply(doc[[1]], xmlValue)
tmp = xmlSApply(doc, function(x) xmlSApply(x, xmlValue))
tmp
tmp = t(tmp)
text1 <-  as.data.frame(matrix(as.numeric(tmp[,-1]), 2))

names(grades) = names(doc[[1]])[-1]

grades$Student = tmp[,1]
#

### use getNodeSet to find right position of answers.
getIDs <- getNodeSet(root, '//head//title')
### here for the ID
ID <- sapply(getIDs, xmlValue)
ID
ans <- getNodeSet(root, '//body//div')
ans
