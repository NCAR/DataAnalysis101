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

fit0<- lm( price ~ year + mileage , data=AudiA4)
summary(fit0)

# now adding the distance 
fit<- lm( price ~ year + mileage + distance, data=AudiA4)
summary(fit)

# checking residuals ...
set.panel(2,1)
plot( AudiA4$year, fit0$residuals)
plot( AudiA4$mileage, fit0$residuals)


# an alternative is to focus on just mileage and add more structure

fitQuad<- lm( price ~ mileage + I( mileage^2),  data=AudiA4)

fit1<- lm( price ~ year + mileage + I( mileage^2) +I(year^2), data=AudiA4)

plot( AudiA4$year, fit1$residuals)
plot( AudiA4$engine, fit1$residuals)

bplot.xy( AudiA4$distance, fit1$residuals)

# Something completely different
# a common least model for difficult data is to transform the response
AudiA4$logPrice<- log10( AudiA4$price)
# here is a different model that also seems to do well
fit2<- lm( logPrice ~ year + mileage, data=AudiA4)
                                        # NOTE that the R^2 from this model is not directly comparable to the unlogged case

                                        # the bargins:

indBargin<- fit2$residuals < -.18



# making predictions
usedCar<- data.frame( mileage = 50000, year = 2014 )

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



