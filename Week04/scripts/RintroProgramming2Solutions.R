

load( "BoulderTemperature.rda")
# recall to get the Years
Year<- as.numeric( row.names( BoulderTemperature))
BoulderAnnualTemp<- apply( BoulderTemperature, 1, mean)


#####################
###  for loop to do some computation
####################

# fit a smoother to these data
# a running mean of 5 years
  Nyear<- length( Year)
  BoulderSmooth<- rep( NA, Nyear)
  for( k in 1 : (Nyear) ){
        # two years on either side  
        ind <- abs( Year - Year[k]) <= 4.0
        BoulderSmooth[k] <- mean( BoulderAnnualTemp[ind] , na.rm=TRUE )
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
# to allow for different spans (not hardwired to "2")
  
# Q Compare smooths for price against mileage in the
# AudiA4 data  -- does this look like a straight line?
#  
# Q do the smooths change if you use a subset of years?
  

  

########################################################################################
####  Supplements 
# Using the fields package,  a more high tech smoother
#       and more complex figure presenting results. 
  
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

fit0<- lm( price ~ year + mileage + I(mileage^2), data=AudiA4)
plot( AudiA4$price, 100*fit0$residuals/AudiA4$price )


# some solutions and a 2-d image smoothing example. 
#
#   Reality leaves a lot to the imagination. -- John Lennon

mySmooth<- function( x,y, span){
  N<- length( x)
 smooth<- rep( NA, N)
  for( k in 1:N  ){
    # two years on either side  
    ind <- abs( x - x[k]) <= span
    smooth[k] <- mean( y[ind], na.rm=TRUE )
  }
  result<- cbind(x, smooth)
}

mySmooth2<- function( x,y, span){
  N<- length( x)
  smooth<- rep( NA, N)
  for( k in 1:N  ){
    # two years on either side  
    ind <- abs( x - x[k]) <= span
    smooth[k] <- median( y[ind], na.rm=TRUE )
  }
  result<- cbind(x, smooth)
  
}

set.seed( 123)

data( lennon)
lennonNoise<- lennon + matrix( rnorm(256^2) *70, 256, 256) 

sImage1<- matrix( NA, 256, 256)
span<- 8
for( k in 1:256){
  sImage1[k,]<- mySmooth( 1:256, lennonNoise[k,], span )[,2]
}
for( j in 1:256){
  sImage1[,j]<- mySmooth( 1:256,sImage1[,j], span )[,2]
}

sImage2<- matrix( NA, 256, 256)
span<- 4
for( k in 1:256){
  sImage2[k,]<- mySmooth2( 1:256, lennonNoise[k,], span )[,2]
}
for( j in 1:256){
  sImage2[,j]<- mySmooth2( 1:256,sImage2[,j], span )[,2]
}



set.panel( 2,2)
image( lennon, col=grey.colors( 256))
image( lennonNoise, col=grey.colors( 256))
image( sImage1, col=grey.colors( 256))
image( sImage2, col=grey.colors( 256))

  
