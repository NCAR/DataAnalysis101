
# functions
#
  load("BT.rda")
# or 
  library( dataWorkshop)
  data(BoulderJuneTemperature)
# finding the inter quartile range:
  BT<-BoulderJuneTemperature$Temp
# 75% quantile  
  BT75<-  quantile( BT,.75)
  
#Q Find the interquartile range   75% - 25% quantiles  

# functions can have many default and optional arguments
  
#Q If you don't specify the ".75" in quantile what does it give you?  

# suppose there is an additional value that is missing 
# missing values in R are NA and occur often in data.
  
 test<- c( BT,NA)  

 #Q find the 75 quantile (check out the help file for quantile)
 
 #Q turn off the label of 75% on the value
 
 # building your own function 
 
 myIQR <- function(y){
            IQR<- quantile( y, .75, names=FALSE) - 
                  quantile( y, .25,  names=FALSE) 
            return( IQR)
 }
 
  myIQR(BT)
  
#Q modify this function to work with NAs
  

  
  

  
  
  
  

