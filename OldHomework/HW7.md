###APPM2720 Homework 8
Due Monday February 29, 2016

This is a short homework to explore least squares fitting.

The Bolder Boulder  race results is in [BB200.txt](http://www.image.ucar.edu/~nychka/Temp/APPM2720/Quiz2/BB200.txt) and is the same data set used in Quiz 2.
The file contains results on the top 200 finishers from the 2014 Bolder Boulder 10K (6.2 miles) footrace. The columns are: place, names, sex/age division (M or F and age cateogry), place in the division, times for each mile, average mile time and the total time. Read in this data using 

````
 results <- read.table("BB200.txt", 
        header=TRUE, skip=2 )
````
Source the handy function  [convertTime](http://www.image.ucar.edu/~nychka/Temp/APPM2720/Quiz2/Quiz2.R)        
and convert the MILE1 split times to numeric by 

````Mile1<- convertTime(results[,6]) ````

- Fit a line by least squares using the Mile1  split    to predict the place in the race. Interpret the slope as: "If a runner decreases his/her split by 10 seconds then they can move up ??? places in the finish."
- Make a diagonostic plot of the residuals (yaxis)  against the predicted values (xaxis) ( the components **residuals** and **fitted.values** from  the **lm** output.) Do you see any patterns?
- Assuming that the  statistical assumptions of the least fit are satisfied find a 95% interval for the estimated slope.Use the standard error in the second column in the coefficients table from the summary of the lm fit. 
Specifically if **fit** is your **lm** fit object
  
````
 look <- summary(fit)
 look$coefficients 
```` 
will give you the table. 
```` look$coefficients[2,2] ````` is the relevant standard error in this case.  
 