
# load the BoulderDaily data set into  R 
# either through the dataWorkshop or just load it form the Week2 folder

load("BoulderTemperature.rda") # monthly mean temperatures
# check out first row
BoulderTemperature[1,]
#extrract 1991 - 2010
tempData<- BoulderTemperature[94 + (1:20),]
# check this out 
tempData
# means  by rows of this table
byYear<- apply( tempData, 1, FUN = mean) # by rows, 1 = first index
# means by columns
byMonth<- apply( tempData, 2, FUN = mean) # by cols, 2 = second index

byMonth

# Q Which month has the biggest difference between the mean temperature and the median 
# temperature?

# the handy IQR fucnction we programmed  
 myIQR <- function(y){
            IQR<- quantile( y, .75, names=FALSE) - 
                  quantile( y, .25,  names=FALSE) 
            return( IQR)
 }
 
# Q find the interquartile ranage (IQR) by months. 
 
# applying functions to different parts of a data set

  load("AudiA4.rda") # or use data(AudiA4) if you have loaded the dataWorkshop paackage
# This dataset is in the form of a data frame -- a table where each column 
# can either be numerical or character values
  AudiA4[1,]
# how many cars are listed in each year?  
  table( AudiA4$year)
# mean price of the cars by year
  meanYear<- tapply( AudiA4$price, INDEX=AudiA4$year, FUN="mean"  )
  meanYear
  
#Q how would you find the IQRs by year?
  
#Q are the mean and median consistent for these data groups?
  
#Q How about the IQR and the standard deviation sd function in R.
  
# are there any unusual values by year?
  plot( AudiA4$year, AudiA4$price)

###########  about boxplots
# boxplots are one of the most useful ways to summarize the spread in a dataset
  
# using boxplots
  set.seed( 223) # set the random seed so we all get the same sample (223 is arbitrary)  
  y1<- runif(10) 
  y2<- y1 + 5
  y3 <- y1*2
  y4<- y1
  y4[1] <- 5
  exampleData<- cbind( y1,y2,y3,y4)
  boxplot( exampleData)
# Q take a look at how y1-y4 are different and make sure you 
# see how the differences are reflected int eh boxplots
  
# a different format for making boxplots
# take the data set in the form of a table and
# reformat as a single set os values but create a separate  group id to 
# indicate the group each value belongs to. 
# use the magic c function to string the table as one long set of values
  exampleData2<- c( exampleData)
  sampleID <- rep(1:4,c(10,10,10,10))
# you might want to print out tempData, tempData2 and sampleID to make
# sure you understand the differences.
  
# a handy way to make boxplots when you have a group id:  
  boxplot( exampleData2 ~ sampleID)
# this is identical to   boxplot( exampleData)!
  
  
#######################################################
#Homework 3   Question 1  
#Q Make boxplots for the monthly temperatures  in BoulderTemperature 
# which months have the  most similar distributions temperatures?
################################################################

#######################################################  
#Homework 3   Question 2  
# Q Use the formula format to make boxplots of the Audi prices by year
# Which years seem to have outliers?
################################################################  

# a little more tricky to do  boxplots by mileage because this is a continuous variable  
# create 4 mileage groups    
  mileGroups<- cut(AudiA4$mileage/1000, breaks= c(0,50,100,150,200) )
# how many in each group?  
  table( mileGroups)
# how to find median price for each group  
  tapply( AudiA4$price, mileGroups, FUN=median)

########################################### 
### Homework 3  EXTRA CREDIT!
#Q make boxplots of prices for thesefour groups
# Which mileage groups overlap in  their prices?
# (This means there are cars in the groups with difference mileage but
#  having similar prices.)
##############################################   
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

  
  
  
  

  
  
  
  

