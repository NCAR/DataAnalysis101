library( dataWorkshop)


library( dataWorkshop)
data( AudiA4)

Y<- AudiA4$price
X<- AudiA4$mileage
ind<- ( X >= 20000)& (X<= 75000)
Y1<- Y[ind]
X1<- X[ind]
# the "raw" distribution of Y1 

# fitting subset and the full data set to look at R^2 and sd's 

# option to give lm subset information

# what about model year?? Is it better?


# A digression: the obvious mess up if the Y's  are scrambled
# relative to the X's

####
#### fitting more than one variable adding the year maybe distance ...
#### a quadratic in mileage  and/or year and mileage together
####

# quadratic model in mileage.

# checking residuals. 

# something completely different ...

# tie this back to the original question. 
indBargin 
# and the cars to look at

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

