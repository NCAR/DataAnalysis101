library(dataWorkshop)

data("WorldBankCO2")
WB<- WorldBankCO2
x<- log10(WB$GDP.cap )
y<- log10( WB$CO2.cap)
plot( x,y, pch=16, col="grey", xlab="log 10 GDP", ylab="log 10 CO2")

# fitting polynomials
x2<- x[ order(x)]
y2<- y[order(x)]  
fit1<- lm( y2~x2)
fit2<- lm( y2~x2 + I(x2^2))
fit3<- lm( y2~x2 + I(x2^2) + I(x2^3))

lines(x2, fit1$fitted.values, col=2, lwd=3)
lines(x2, fit2$fitted.values, col=3, lwd=3)
lines(x2, fit3$fitted.values, col=4, lwd=3)

plot( x,y, pch=16, col="grey", xlab="log 10 GDP", ylab="log 10 CO2")

fitSreg<- sreg( x2, y2)
points(fitSreg$predicted, col=2, lwd=3 )
lines(x2, fit3$fitted.values, col=4, lwd=3)

xgrid<- seq( min( x2), max(x2),,200)

fHat<- predict( fitSreg, x= xgrid)
lines( xgrid, fHat, lwd=3)

usrCoord<- par()$usr
# numerically:
fHatD<- diff( fHat)/ ( xgrid[2]- xgrid[1])
# exact:
fHatD<- predict( fitSreg, x= xgrid, derivative=1)
par( usr= c( usrCoord[1:2], range( fHatD)) )

# note fHatD has one less value than fHat from differencing
lines(  xgrid, fHatD, col="magenta", lty=2, lwd=3)
axis( side=4, col="magenta")

# changing the smoothing

fields.style()
plot( x,y, pch=16, col="grey", xlab="log 10 GDP", ylab="log 10 CO2")

fitSreg<- sreg( x2, y2, df=c( 3, 8, 20))
matlines( fitSreg$predicted$x, fitSreg$predicted$y, col=c(3,2,3), lty=c( 2,1,2), lwd=3)


# a sanity chcek of a smoother

x<- sort(runif(200))
true<-  x*(1-x)^3 
true<-  true/ sd( true)
y1<- true + rnorm( 200)



# 2-d problem
data(VictoriaT )
set.panel( 3,3)
for ( k in 1:9){
image.plot(VictoriaT$x, VictoriaT$y, VictoriaT$z[,,k] )
}

# another 2-d problem

data(COmonthlyMet)
ls()
x<- CO.loc
y<- CO.tmin.MAM.climate
elev<- CO.elev
good<- !is.na( y)
x<- x[good,]
y<- y[good]
elev<- elev[good]


quilt.plot( x, y)
US( add=TRUE)
title("CO MAM average minimum temperatures")


fit1<- Tps( x, y)

surf<- predictSurface( fit1)
surfSE<-predictSurfaceSE( fit1)







fields.style()
plot( elev, y, xlab="elevation", ylab="MAM minimum (C) ")

X<- cbind( x, elev)
lmObj<- lm( y ~ lon + lat + elev, data=X )
summary( lmObj)

quilt.plot( x, lmObj$residuals)
US( add=TRUE, col="grey", lwd=2)


data( RMelevation) 
# elevations for the Rocky mountain area.
elevGrid<- crop.image( RMelevation, x)

contour( elevGrid, levels=c( 2e3), add=TRUE, col="grey")


















