library( dataWorkshop)

# Intro to least squares 
# as an example work with the AudiA4 data
# 

data( AudiA4)
Y<- AudiA4$price
X<- AudiA4$mileage

# finding the mean price the hard way!

plot( X,Y)
# a linear relationship might  more sense for mileage in the range [20K, 75K]
ind<-  (X>= 20000) & (X< 75000)    # & is logical 'and'
X1<- X[ind]
Y1<- Y[ind]
points( X1,Y1, col="red")

fit<- lm( Y1~X1)

fitted.values <-  fit$coefficient[1] + fit$coefficient[2] * X1
residuals <-  Y1 - fitted.values

summary( fit)
# this is called a diagnostic plot
#
plot( fit$fitted.values, fit$residuals)
abline( h=0, col="grey", lwd=2)
# I dont see a pattern in this fit so the LS fit is reliable

# Q1 How does this diagnostic plot change when the full data is used?
# getting started:

fitFull<- lm( Y~X )


# About standard deviations. 
# measure of spread in Y1
 sd( Y1)
# measure in residuals
 sd( fit$residuals)
 
#  
 
 
 



# comparing the fit to using just a constant 

fit0<- lm(Y ~ 1)
summary( fit0)
# Notice how large the residual standard deviation is. 

# understanding the uncertainty in a LS fit





# this is what is called a monte carlo experiment

Beta1<- 

