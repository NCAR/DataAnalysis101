#APPM 2720 Homework 3 
--
Due Monday of Week 4 

Please send me your plots and comments by 
email: nychka@ucar.edu and 
with the subject starting:  APPM2720 

Refer to the script **RplottingIntro.R** for some background on plotting to help with this HW.  


 *All plots that you turn in should have informative axis labels and a title.* 

Note that for the datasets in these examples you can either load them from the Week03 folder or they are in  the **dataWorkshop** package. (See instructions at end of this.)



Q1 Make boxplots for the monthly temperatures  in **BoulderTemperature** ( ```BT.rda``` ). Which months have the most similar distributions of temperatures?
 
Q2 Use the formula format to make boxplots of the Audi A4 prices by year. Which years seem to have outliers?

```{r}
 mileGroups<- cut(AudiA4$mileage/1000, breaks= c(0,50,100,150,200) )
# how many in each group?  
  table( mileGroups)
# how to find median price for each group  
  tapply( AudiA4$price, mileGroups, FUN=median)
```

Q3 Make boxplots of prices for these four groups
 Which mileage groups overlap in their prices?
 (This means there are cars in the groups with difference mileage but
  having similar prices.)
  
Q4 Use the **quilt.plot** function in fields to make a figure that helps to show if price depends on both on year and mileage together.
If you know the year of the car does it also help to know the mileage? Hint: for the quilt.plot function you may want to try different values of **nx** and **ny** to get the best divisions of the data into boxes. 

--

## installing a package from the web
To install  this package, download it from my web site [dataWorkshop](
http://www.image.ucar.edu/~nychka/Temp/APPM2720/dataWorkshop_2.3.tar.gz). Then in Rstudio choose TOOLS -> INSTALL PACKAGES -> Package Archive and use the browse to locate your download folder and the dataWorkshop file (dataWorkshop_2.3.tar.gz) in it. 
 
If you have installed this package then it is easy to load the data sets. For example, 

```
library( dataWorkshop)
data(BoulderTemperature)
data( AudiA4)
```
will load these for you. 




 
