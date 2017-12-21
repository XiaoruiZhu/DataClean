# DataClean

[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/DataClean)](https://cran.r-project.org/package=DataClean)
[![Downloads](http://cranlogs.r-pkg.org/badges/DataClean)](http://cranlogs.r-pkg.org/badges/DataClean)
[![Total](http://cranlogs.r-pkg.org/badges/grand-total/DataClean)](http://cranlogs.r-pkg.org/badges/grand-total/DataClean)

DataClean is a package including all heavily used functions in the precess of data cleaning. This package is designed for people who will deal with big massive data. Because the incentive of creating this package originated from my real research projects, my purpose is to design a package including all functions that might be used in a data analysis study. 

The structrue of this package is as follows:

1. A set of functions are designed for data collection and extracting no matter from "html", "xls" or "xlsx" files. Or you can use several function to automatically pull data on specified websites.  

    * "getSfilesPath" is designed to get paths of a specified set of files that saved in a folder. If you want to collect all files under certain folder, this function should be the perfect one. It will collect all files with certain criterie of name. Then this function will return a list will all paths of those files so that further import or read is feasible. 
    * "htmltodata" is designed for variables collection from files in "html" type. 
    * "MergerXLSX" is designed for excel file merging. It will allow one to merge two xlsx files by a same variable. For reliability of this function, clean the ID variable first, then try this function. Extra space or quotation mark could cause issues such as wrongly matches.

2. Package development agenda: 

    * "variableclean" is a function to clean specified variables under certain conditions. Three ordinary situations are the purpose of this function. First, return numerical value ahead or behind specified words. Second, return numerical value that display primarily. Third, return value in number not in words.
    * "Exceltodata" is a simple redesigned function that can import data from all Excel files. It depends on "xlsx" package.

   
