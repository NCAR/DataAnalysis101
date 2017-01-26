
# working with subscripts
X<- -10:5
# single subscripts, sequences, irregular, logical

# load Boulder June temperatures  this is a 2X30 table (aka an array)
load("BT.rda")
# the dim command
# first 10 values of temp
# subscripts
# first 10 rows.

# values greater than 70 degrees

#Q Plot the June temperatures by year highlight the 
# values over 70.

# functions in R
# mean, effect of na.rm=TRUE

# quantile function
# and interquartile range

# apply function
load("AudiA4.rda")
head( AudiA4)
# means of first 4 columns of this data set
 apply(AudiA4[,1:4], MARGIN= 2, FUN = "mean" )

 # use tapply to find means by year
 
#  boxplots of prices by year
 
# writing your own.
# function has three parts:
# 1 calling arguments, 
# 2 body with R code
# 3 return statement

# a function to find the IQR
 
# adding na.rm argument, wipe out name
 
# which year has the biggest spread?
 
 
 
 







