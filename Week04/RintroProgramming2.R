

load( "BoulderTemperature.rda")
# recall to get the Years
Year<- as.numeric( row.names( BoulderTemperature))
BoulderAnnualTemp<- apply( BoulderTemperature, 1, mean)


#####################
###  for loop to do some computation
####################

# fit a smoother to these data
# a running mean of 9 years
  Nyear<- length( Year)
  BoulderSmooth<- rep( NA, Nyear)
  for( k in 1 : (Nyear) ){
        # four years on either side  
        ind <- abs( Year - Year[k]) <= 4.0
        BoulderSmooth[k] <- mean( BoulderAnnualTemp[ind]
                                   , na.rm=TRUE )
  }
  result<- cbind( Year, BoulderSmooth)

  plot( Year, BoulderAnnualTemp)
  lines( result, col="blue", lwd=2)
  points( result, col="blue4", cex=.5)
  
# Q make the smoother into a function that takes 
# arbitrary data  ( e.g. x, and y)
#     mySmooth<- function( x,y){
#      ...
#       } 

# the goal is a function so that
#  
#  result<- mySmooth( Year, BoulderAnnualTemp)
# gives the same  output as the code above
  
# Q What happens when you apply your smooth to the smoothed results?
  
# Q add an extra argument to your function
# to allow for different spans (not hardwired to "4.0")
  
# Q Compare smooths for price against mileage in the
# AudiA4 data  -- does this look like a straight line?
#  
# Q do the smooths change if you use a subset of years?
  

  

########################################################################################
####  Supplements 
# Using the fields package,  a more high tech smoother
#       and more complex figure presenting results. 
# this is also an example of adding a legend. 
  
load("AudiA4.rda")  
library( fields)
  plot(AudiA4$mileage, AudiA4$price,
        xlab="Mileage", ylab="price", cex=.5 )
out<- sreg( AudiA4$mileage, AudiA4$price )
lines( out$predicted, col="red", lwd=4)
# some smooths by years
ind<- AudiA4$year < 2010

out1<- sreg( AudiA4$mileage[ind], AudiA4$price[ind] )
lines( out1$predicted, col="blue4", lwd=4, lty=2)
out2<- sreg( AudiA4$mileage[!ind], AudiA4$price[!ind] )
lines( out2$predicted, col="green4", lwd=4, lty=2)

par(xpd=TRUE)# allow legend to go outside the plot
legend( 140000, 50000,
        legend=c("full data", "older than 2010", "2010 or newer"),
        lty=c(1,2,2), col=c("red", "blue4", "green4"),
        cex=.8)


