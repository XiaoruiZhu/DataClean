# DataClean
DataClean is a package including all heavily used functions in the precess of data cleaning. This package is designed for people who will deal with big massive data. Because the incentive of creating this package originated from my real research projects, my purpose is to design a package including all functions that might be used in a data analysis study. 

The structrue of this package is as follows:

1. A set of functions are designed for data collection no matter from "html", "xls" or "xlsx" files. Or you can use several function to automatically pull data on specified websites.  

    * "getSfilesPath" is designed to get paths of a specified set of files that saved in a folder. 
    * "htmltodata" is designed for variables collection from files in "html" type. 
    * "Exceltodata" is a simple redesigned function that can import data from all Excel files. It depends on "xlsx" package.

2. A set of functions are designed for data extracting. 

    * "MergerXLSX" is designed for excel file merging. It will allow one to merge two xlsx files by a same variable. **Be careful with the reliable of this function. According to the results of my projects, this function maybe not as reliable as I image. So I will try to revise this function so that it will work better**
    * "variableclean" is a function to clean specified variables under certain conditions. Three ordinary situations are the purpose of this function. First, return numerical value ahead or behind specified words. Second, return numerical value that display primarily. Third, return value in number not in words.
    * "textmining" is 
    * 

