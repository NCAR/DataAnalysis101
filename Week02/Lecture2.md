#Lecture 2 APPM2720 spring 2016

This lecture is an introduction to R and some 
stats nuggets and experience in programming tossed in along the way. 

The way to participate in this lecture is to 

- open R studio (just R will be OK too.) 

- load or create an R  script file in to your editing window

- cut, paste R commands from your editing window into the R command window to run the code. 

- add more code and comments as you work through the
lecture and answer the questions. 

- when you are done (or periodically) save your file  in R studio. 

The R scripts in this lecture cover 
 
- Basic housekeeping of your R workspace **RBasics.R**

- Arithemtic and naming data sets (objects) **RMath.R**

- Subsetting and extracting pieces of a data set **RSubsetting.R** (This will be assigned to work through outside of class.)

<!---
#- How to use functions with data sets **RFunctions.R**


- Plotting basics **RPlotting.R**
-->
# R survival

- R is case senitive

- lines starting with # are comments 
 
-  **help**    help(plot) or ?plot gives you help documentation on a function or data set

- When you quit R your workspace you will be asked to save your workspace. To recover past commands typed in see the history function. To save the workspace in your session use **save.image()** in the command window.  
 
## The magnicifient seven 

Basic functions to survive in R:

- `ls         `lists the data sets in your workspace  ls()

- `rm      `  removes a data set from your workspace  rm(classGrades)

- `<-         ` assigns values to a data set  a <- 3.5

- `seq or  :  `  creates a sequence of equally spaced values.     1:4  or  seq( 0,1,length.out=10)
- `[ ]    ` lets you select subsets of a data set or particular values.    `a[1:5] or b[1,2] or b[,3]`

- `c   ` combines values or data sets   `a<- c( 3.5, 4.8) or  X <- c(a, c)`


- ` library   ` loads an additional library to use in your R session  `library(fields)`
 
# Creating reports for homework assignments and projects

- the notebook button (top line in the editting window a spiral notebook icon) in Rstudio will let you convert your R code into a spiffy report. 

- You can convert your R code into the markdown format to add text and still be able to "run" your code and get a good looking report. To get started create a blank R Markdown file using the green +
 button, follow the hints  and then fill it in!
 
 












 