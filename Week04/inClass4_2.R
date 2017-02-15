

load( "BoulderTemperature.rda")
# recall to get the Years
Year<- as.numeric( row.names( BoulderTemperature))
BoulderAnnualTemp<- apply( BoulderTemperature, 1, mean)
# erasing the data value names 
names( BoulderAnnualTemp) <- NULL

plot(Year, BoulderAnnualTemp, col="red" )

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
#    
  mySmooth<- function( x,y){
         Hold<- rep( NA, length(x) )
         for( k in 1:length(x)){
           ind<- abs( x- x[k]) <= 4.0
           Hold[k] <- mean( y[ind], na.rm=TRUE)
         }
         results<- cbind( x, Hold)
         return( results)
       } 
  
  result<- mySmooth( Year, BoulderAnnualTemp)  
  result2<- mySmooth( result[,1],result[,2])
  
  plot( Year, BoulderAnnualTemp)
  lines( result, col="orange", lwd=2)
  lines( result2, col="green", lwd=2)
  

# the goal is a function so that
#  result<- mySmooth( Year, BoulderAnnualTemp)
# gives the same  output as the code above
  
# Q What happens when you apply your smooth to the smoothed results?
  
# Q add an extra argument to your function ( e.g. span )
# to allow for different spans (not hardwired to "4.0")
  mySmooth2<- function( x,y, span =10000){
    Hold<- rep( NA, length(x) )
    for( k in 1:length(x)){
      ind<- abs( x- x[k]) <= span
      Hold[k] <- mean( y[ind], na.rm=TRUE)
    }
    results<- cbind( x, Hold)
    return( results)
  } 
  
# Q Compare smooths for price against mileage in the
# AudiA4 data  -- does this look like a straight line?
#  
  look<- mySmooth2( AudiA4$mileage,AudiA4$price )
  
  plot( AudiA4$mileage,AudiA4$price )
  points( look, col="red", lwd=2)
  
# Q do the smooths change if you use a subset of years? 
# e.g. years > 2010
  

########################################################################################
####  Supplements 
# Using the fields package,  a more high tech smoother
#       and more complex figure presenting results. 
# this is also an example of adding a legend. 
  
data( AudiA4)
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
        col=c("red", "blue4", "green4"),
        cex=.8, lwd=c(4,4,4), lty=c(1,2,2))


library( rgl)
X<- cbind( AudiA4$mileage, AudiA4$year,  AudiA4$price)
colID<- as.numeric(AudiA4$engine)
plot3d( X, col=colID, xlab="Mileage", ylab="Year", zlab="Price")




