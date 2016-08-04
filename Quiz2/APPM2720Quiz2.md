#APPM2720 Quiz 2
You should work on this quiz on your own and not 
get help from others. You are however, encouraged to use the web and any other reference materials  and resources to complete these questions. All the numbered questions count equally for 10 points.  

All data files are included in the [APPM2720 Quiz2 directory](http://www.image.ucar.edu/~nychka/Temp/APPM2720/Quiz2) you should also use the lectures and  R code from the class as back ground and examples. 

Please submit your work to me by email <nychka@ucar.edu> by midnight  on Monday February 22, 2016. You can submit your answers:

-  in the body of an email and attach the plots 
-  use the markdown format in Rstudio along with the knitr button to create an html file that you email to me (recommended!). 
-  add your text answers as comments in an R script, use the notebook button and convert your R script to an html file.
  
-
###(PART A)

The file **BB200.txt** contains 
results on the top 200 finishers from the 2014 Bolder Boulder 10K (6.2 miles) footrace. 
 The  columns are: place, names, sex/age division
(M or F and age cateogry), place in the division, 
times for each mile, average mile time and the total time. 
 This file can be read into R using 
```` results <- read.table("BB200.txt", header=TRUE, skip=2 ) ````
In the file Quiz2.R is a handy function **convertTime** to convert the
times in each column into numerical values 
e.g. 

```` Mile1<- convertTime(results[,6]) ````

Don't forget to source this function in order to use it!

(1) Explain why ```` header=TRUE```` is needed. What is the effect if this is omitted? 

(2) Explain why ````skip = 2 ```` is needed. What is the effect if this is omitted? 

(3) Convert the times to numerical values. Explain whether the first mile split time (MILE1) is predictive or not predictive of the place (PLACE). Include a figure to support your answer.

(4) Give one disadvantage or limitation of the **convertTime** function. 
(As background you should know that  the Bolder Bouder has about 50,000
participants many who enjoy walking the course.) 

(5) The file **BB200Raw.txt** is closer to the raw data that was extracted from the web. ````read.table```` does not work on this file for three separate reasons. What are the three aspects that need to be corrected for this file to be read in by **read.table** ?

*Hint:* Compare this file to the one that works!

-
###(PART B)
The file **CUNorlinQuad.jpg** is an aerial photo of
Norlin Quad.

(6) Read this image into R. What are the dimensions of this image and the total number of pixels? 

(7) Convert this image to raster format and find the number of pixels that are exactly white. Based on the image does this answer surprise you?

*Hint:* Recall that the color code for pure white is "#FFFFFF" and 
that summing logical values (e.g. using the **sum** function) will count the number of TRUE cases. 

-
###(PART C)
The file **testLennon.txt** is a text version of the lennon image but of lower resolution so it is a smaller file.

(8) Create an image matrix using the **scan** and **array** functions and make a grey scale image plot. 

(9) **testLennon.txt** is called a self-describing file because in the first few lines is has the information to format the image. Write an  R function 
of the form **readImage( fname) ** that uses the **scan** function twice, calls the  **array** function with the dimensions that have been read in and finally  returns the image.
 
Your code should work for any image in this format by just giving it the file name.  e.g. 
````readImage("testLennon.txt")````
will return the same image matrix that you found for (7).

-
###(PART D)

 Pick a company that you are interested in and go to 
 [Yahoo Finance](http://finance.yahoo.com/)
 Type in the company name in the search window and in the company page choose the item *Historical Prices* in the menu on the left side. 

Download prices for the past year in csv format. 
 (Click on the option at the bottom of the table 
*Download to Spreadsheet* )

(10) Read these into R and  make a plot of the daily closing and opening prices over time. Comment on any patterns.

Note: You can convert the dates in the first column to a better form by using the **as.Date** function. For example if the **stockData** is your data frame  then ````stockData$Date <- as.Date(stockData$Date) ```` will do it.  



  







 

 