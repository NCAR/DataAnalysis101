# review about the value of plotting data
# all four of these data sets have th same LS results
# ... but three should be summarized by a line!
library( dataWorkshop)
data(anscombe)
X<- anscombe[,1:4]
Y<- anscombe[,5:8]

set.panel( 2,2)
par( mar=c(3,3,1,1))
yr <- range( Y)
xr <- range( X)
for(  k in 1 :4){
  plot( X[,k], Y[,k], pch =16, col="orange3",
         ylim=yr, xlim=xr)
  fit<- lm( Y[,k] ~ X[,k])
  abline(fit$coefficients, col="grey", lwd=2 )
}


set.panel( 2,2)
par( mar=c(3,3,1,1))
yr<- c( -2, 3)
xr< range( X)
for(  k in 1 :4){
  fit<- lm( Y[,k] ~ X[,k])
  plot( X[,k], fit$residuals, pch =16, col="orange3",
        ylim=yr, xlim =xr)
    abline(h=0, col="grey", lwd=2 )
    print( summary(fit)$sigma)
}


set.panel( 2,2)
par( mar=c(3,3,1,1))
yr<- c( -2, 3)
xr< c( 5, 12)
for(  k in 1 :4){
  fit<- lm( Y[,k] ~ X[,k])
  plot( fit$fitted.values, fit$residuals, pch =16, col="orange3",
        ylim=yr)
  abline(h=0, col="grey", lwd=2 )
  print( summary(fit)$sigma)
}


