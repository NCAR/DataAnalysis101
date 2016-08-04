library( dataWorkshop)

set.seed( 123)
# the power of multiple regression
X1<- rnorm(20)
X2<- rnorm( 20)

# Y is  almost perfectly predictable if you know X1,X2, X3
Y<- X1 + 1.2*X2 + .01*rnorm(20)
testData<- data.frame( X1, X2,  Y)

# all pairwise scatter plots
pairs( testData)

fit1<- lm( Y~ X1)
summary( fit1)

set.panel( 1,2)
plot( X2, fit1$residuals)

fit2<- lm( Y~ X1 + X2)


data( AudiA4)
pairs(AudiA4[,1:6])
AudiA4$yearF<- as.factor( AudiA4$year)
fit0<- lm( price ~ year + mileage , data=AudiA4)

fit<- lm( price ~ year + mileage + distance, data=AudiA4)
summary(fit)

set.panel(2,1)
plot( AudiA4$year, fit0$residuals)
plot( AudiA4$mileage, fit0$residuals)


fit1<- lm( price ~ year + mileage + I( mileage^2) +I(year^2), data=AudiA4)

plot( AudiA4$year, fit1$residuals)
plot( AudiA4$engine, fit1$residuals)

bplot.xy( AudiA4$distance, fit1$residuals)

# making predictions
usedCar<- data.frame( mileage = 50000, year =2014,  distance =0)

est<- predict( fit1, newdata=usedCar)

# fitting to a subset of the data (90%) and testing predictions on the
# part left out (10%)
# This is termed 10-fold cross validation.

N<- nrow( AudiA4)
set.seed( 223)
sub<- sample(1:N, N*.9, replace=FALSE )

subData<- AudiA4[sub,]
fitSub<- lm( price ~ year + mileage + I( mileage^2) +I(year^2), data=subData)
# the data NOT as the subset
outData<- AudiA4[-sub,]

pred<- predict( fitSub,outData )



