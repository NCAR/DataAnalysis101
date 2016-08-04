library( dataWorkshop)
data( COmonthlyMet)

ls()

plot( CO.loc)
US( add=TRUE)
x<- CO.loc
y<- CO.tmin.MAM.climate
elev<- CO.elev

good<- !is.na( y)
y<- y[good]
x<- x[good,]
elev<- elev[good]


 stats( y)
 
quilt.plot( x, y)
 US( add=TRUE)
 
 quilt.plot( x, y, nx=20, ny=20)
 US( add=TRUE)

 
 # 
 set.panel( 3,1)
plot( x[,1], y) 
plot( x[,2], y)
plot( elev,y) 
 
fit<- lm( y ~ x[,1] + x[,2] +elev)

plot( fit$fitted.values,fit$residuals)

quilt.plot( x, fit$residuals)

# fit a thin plate 
fit1<- Tps( x, fit$residuals)
set.panel( 2,1)
quilt.plot( x, fit$residuals)
surface(fit1, zlim=range(fit$residuals ))

fit2<- Tps( x, y, Z=elev)

plot( fit2$fitted.values, fit2$residuals,
              ylim=range(fit$residuals))
plot( fit$fitted.values, fit$residuals)












 
 


