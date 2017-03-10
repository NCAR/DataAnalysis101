library( dataWorkshop)


library( dataWorkshop)
data( AudiA4)

Y<- AudiA4$price
X<- AudiA4$mileage

ind<- ( X >= 20000)& (X<= 75000)
Y1<- Y[ind]
X1<- X[ind]

# the "raw" distribution of Y1 
hist(Y1)
sd(Y1)
mean(Y1)

# fitting subset and the full data set to look at R^2 and sd's 
fitSubset<- lm( Y1~ X1)
sd(fitSubset$residuals)
hist( fitSubset$residuals)
# finding R squared

# 
R2 <-  ( 1 -  sd(fitSubset$residuals )^2/ sd( Y1)^2 )
summary( fitSubset)


# option to give lm subset information
# cleaner way to fit the data without some 
# intermediate stuff
fitSubset<- lm( price ~ mileage, data=AudiA4, subset=ind)

# what about model year?? Is it better?

fitSubset2<- lm( price ~ year, data=AudiA4, subset=ind)



# A digression: the obvious mess up if the Y's  are scrambled
# relative to the X's

####
#### fitting more than one variable adding the year maybe distance ...
#### a quadratic in mileage  and/or year and mileage together
####
fit0<- lm( price~mileage, data=AudiA4)
# added variable plot
plot(AudiA4$year, fit0$residuals )

fit1<- lm( price ~ mileage + year, data=AudiA4)
summary(fit1)

set.panel( 2,1)
plot( AudiA4$mileage, fit1$residuals)
plot( AudiA4$year, fit1$residuals)

# quadratic model in mileage.
fit2<- lm( price ~ mileage + I( mileage^2 ) + 
                        year, data=AudiA4)
plot(fit2$fitted.values,fit2$residuals )
plot( AudiA4$year, fit2$residuals)

fit3<- lm( price ~ mileage + I( mileage^2 ) + 
                 year + I (year^2), data=AudiA4)

# checking residuals. 
plot(fit3$fitted.values,fit3$residuals )
abline( h = 0 , col="orange", lwd=2 )

# something completely different ...
AudiA4$logPrice<- log10( AudiA4$price)
fit4<- lm(logPrice ~ mileage + year, data=AudiA4 )

plot(fit4$fitted.values,fit4$residuals )
abline( h = 0 , col="orange", lwd=2 )



# tie this back to the original question. 
indBargin <- fit4$residuals <= -.15

# and the cars to look at
AudiA4[indBargin,]

# making predictions
usedCar<- data.frame( mileage = 50000, year = 2014,  distance =0)
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

