
# functions
#
  load("BT.rda")

# finding the inter quartile range:
  BT<-BoulderJuneTemperature$Temp
# 75% quantile  
  BT75<-  quantile( BT,.75)
  
#Q Find the interquartile range   75% - 25% quantiles

# check this against the built in function

 IQR( BT)

# functions can have many default and optional arguments
  
#Q If you don't specify the ".75" in quantile what does it give you?  

# suppose there is an additional value that is missing 
# missing values in R are NA and occur often in data.
  
 test<- c( BT,NA)  

 #Q find the 75 quantile (check out the help file for quantile)
 
 #Q turn off the label of 75% on the value
 
# building your own function
# here is a function that adds the squares of two numbers
# it has three parts, the calling arguments, the body where you do the
# work and then returning any results
myFun<- function( a,b){
    result<- a^2 + b^2
    return(result)
}

#you only copy and paste this into your session once

  test1<- myFun( 2,3)
  test2<- myFun(1:5, 11:15)
# note that the a, b and result are only used inside the function and
# do not appear in your workspace
# also since the body is normal R code this works for vectors automatically
  x<-1:5
  y<- 11:15
  myFun( x, y)






 
 myIQR <- function(y){
            IQR<- quantile( y, .75, names=FALSE) - 
                  quantile( y, .25,  names=FALSE) 
            return( IQR)
 }
 
  myIQR(BT)
  
#Q modify this function to work with NAs

myIQR <- function(y, na.rm=FALSE){
            IQR<- quantile( y, .75,  names=FALSE,  na.rm=na.rm) - 
                  quantile( y, .25,  names=FALSE, na.rm=na.rm) 
            return( IQR)
 }


myIQR <- function(y, na.rm=FALSE){
# an example of adding a warning     
    if( na.rm){
        warning("NAs removed from the data")
    }
            IQR<- quantile( y, .75, names=FALSE, na.rm=na.rm) - 
                  quantile( y, .25,  names=FALSE, na.rm=na.rm) 
            return( IQR)
 } 

  
  

  
  
  
  

