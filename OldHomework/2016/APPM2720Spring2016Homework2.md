## APPM2720 Spring 2016 Homework 2

This homework should be sent to 
<nychka@ucar.edu> before the 3rd class on 
Wedne/Users/nychka/Home/Teaching/RDataAnalysis/Week1/RBasics.R
/Users/nychka/Home/Teaching/RDataAnalysis/Week1/RFunctions.R
/Users/nychka/Home/Teaching/RDataAnalysis/Week1/RintroPlotting.R
/Users/nychka/Home/Teaching/RDataAnalysis/Week1/Rmath.R
/Users/nychka/Home/Teaching/RDataAnalysis/Week1/RSubsetting.Rsday, January 20,2016. You are welcome to work together but please send in individual assignments. 
(Note that the only thing you need to send back to me is the plot from the last problem!) 

*If you have not been able to install
RStudio on your personal PC or Mac at this 
point please send me email with the issues and 
we can work out how to fix them.*

Download all the material from [Week1](http://www.image.ucar.edu/~nychka/Temp/APPM2720/Week1/)
(Some of these files have been corrected from lecture so download everything again.)



(1) One strength of R is the wealth of add on packages that are contributed from a worldwide commumity of data scientists. For this class we will focus on the 
package **fields** and **dataWorkshop**. From R studio install **fields**. Go to the *tools* menu and select
*install packages*. The default choices are OK to use and fill in **fields** in the package box.
To test if fields is working try 
 
``` 
 library(fields)
 data(lennon)
 image.plot(lennon, col=grey.colors(256), axes=FALSE)
```
(2) Install the **dataWorkshop** package.
(This is not on CRAN so it involves a few more steps.) 

-  Download the package source code from my webspace  [**dataWorkshop_2.2.tar.gz**](http://www.image.ucar.edu/~nychka/Temp/dataWorkshop_2.2.tar.gz)
-  In *tools -> install.packages -> Install From*
 choose the  *Package Archive*  option and indicate the downloaded file (**dataWorkshop_2.2.tar.gz**). To test that this is working try

 ``` 
 library(dataWorkshop)
 data(AudiA4)
 plot( AudiA4[,3]/1000, AudiA4[,2],pch=16, cex=.5,
      ylab="Asking Price", xlab="Mileage (thousands)")
```

(3)  Work through the Week1 R script  **RSubsetting.R** on your own. (You may also want to look at other tutorials to learn more about subsetting.) To load the two datasets in this script you should change your working directory to where ever you put all the **Week1** files
To change the working directory in RStudio
Use the Tools | Change Working Dir... menu (Session | Set Working Directory on a mac). 

(4) People often wonder if last years weather is related to this years. Make a plot of the current year's June Boulder temperaure (y axis) against last year's (x axis) and comment on any relationship or lack of one. Be sure to add axis labels and a title to explain what is being plotted. Modify the colors and symbols if you want!

-  
Hints: To do this you will need to subset the **BT** data into two data sets: one with with the first 29 values (1:29) and the second with the last 29 values (2:30). Note that if you want to avoid hard coding these limits you can create the variable say 'N <- length(BT)' and use '''(N-1)''' and '''N''' in place of 29 and 30. This is good pratice 

- Save your plot to a file using the export button in the plot window. 
Or ...
you can use the *compile notebook* button 
(in the editting window on the top  line, it looks like a spiral notebook.) to generate an html file that has your code and the figure and you can submit that as your work.  



 
 
