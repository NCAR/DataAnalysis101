library( dataWorkshop)
data( AudiA4)

Y<- AudiA4$price
X<- AudiA4$mileage

ind<- ( X >= 20000)& (X<= 75000)
Ysub<- Y[ind]
X1<- X[ind]
N<- length( X1)
 hist( Ysub)
 abline( v= mean(Ysub), col='brown')

 sd( Ysub) 
 
 fit1<- lm( Ysub ~ X1)
 summary( fit1)
 
 fit1A<- lm(Y ~ X)
 plot( X,Y)
 
 X2<- AudiA4$year[ind]
 plot( X2, Ysub)
 fit3<- lm( Ysub~ X2)
 
 set.panel( 1,2)
 plot( X1, Ysub)
 abline( fit1$coefficients, col="magenta", lwd=2)
 
 plot( X2, Ysub)
 abline( fit3$coefficients, col="magenta", lwd=2)
 
 ix<- sample( 1:N, replace=FALSE)
 
 Yscrambled<- Ysub[ ix]
 
 fit4<- lm( Yscrambled ~ X1)
 
 ### examine residuals from year lm fit
 
 plot( fit3$fitted.values, fit3$residuals)
 
 plot( X1, fit3$residuals)
 
 abline( h=0, lwd=3)
 
 fit5<- lm( Ysub ~ X1 + X2 )
 
plot( fit5$fitted.values, fit5$residuals)
abline( h=0, lwd=3)

locator(fit5$fitted.values, fit5$residuals) 


 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
