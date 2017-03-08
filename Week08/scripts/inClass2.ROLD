library( dataWorkshop)

set.seed(223)

X1<- rnorm(20)
X2<- rnorm(20)
Y<- X1 + X2 + .01*rnorm(20)
plot( X1, Y)
plot( X2,Y)
fit<- lm( Y~X1)
plot( X2, fit$residuals)

fit1<- lm( Y~ X1 +X2)

library( fields)
set.panel(1,2)
plot( X1, Y)
plot( X2,Y )

data(AudiA4)

fit0<- lm( price ~ mileage + year, AudiA4)

plot( AudiA4$mileage, fit0$residuals)
fit1<- lm( price ~ mileage + I(mileage^2) + year, AudiA4)
summary( fit1)

plot( AudiA4$mileage, fit1$residuals)

plot( AudiA4$year,fit1$residuals )
fit2<- lm( price ~ mileage + I(mileage^2) + year+ I(year^2), AudiA4)
plot( AudiA4$engine, fit2$residuals)
plot( AudiA4$distance, fit2$residuals)
bplot.xy( AudiA4$distance, fit2$residuals)


