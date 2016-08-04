library( dataWorkshop)
data( "WorldBankCO2")

WB<- WorldBankCO2

x<- log10( WB$GDP.cap)
y<- log10( WB$CO2.cap)
x2<- x[ order(x)]
y2<- y[order(x)]

plot( x2, y2)
fit1<- lm( y2 ~ x2)

lines(x2, fit1$fitted.values, col="green4")
fit2<- lm( y2 ~ x2 + I(x2^2))

lines(x2, fit2$fitted.values, col="green4")

fit3<- lm( y2 ~ x2 + I(x2^2) + I(x2^3))

lines(x2, fit3$fitted.values, col="green4", lty=2)


fitSreg<- sreg( x2, y2)
lines( fitSreg$predicted, col="red4", lwd=2)

plot( x2, y2)
#lines( fitSreg$predicted, col="red4", lwd=2)
xgrid<- seq( min( x2), max( x2),,200)
fHat<- predict( fitSreg, x=xgrid)
lines( xgrid, fHat, col="blue")
fHatD<- predict( fitSreg, x=xgrid, derivative=1 )

usrCoords<- par()$usr
usrCoords[3:4]<- range(fHatD )

par( usr= usrCoords )

lines( xgrid, fHatD, col="blue", lty=2)
axis( side=4)

data(COmonthlyMet)

plot(CO.loc)

US( add=TRUE)









