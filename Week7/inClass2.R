library( dataWorkshop)
data(AudiA4)

Y<- AudiA4$price
X<- AudiA4$mileage

plot( X,Y)

ind<- (X >= 20000) &(X<=75000)

X1 <- X[ind]
Y1 <- Y[ind]
points( X1,Y1, col="red2")

fitGood<- lm(Y1 ~X1)

abline(a= fitGood$coefficients[1], b= fitGood$coefficients[2],
        col="purple", lwd=2)
abline(fitGood$coefficients )

x<- seq( 0, 1e5, length.out=213)
lines( x,
       fitGood$coefficients[1] + fitGood$coefficients[2]*x,
       col="blue", lwd=5)

fitBad<- lm( Y ~ X)
abline( fitBad$coefficients, col="orange4", lwd=3)





