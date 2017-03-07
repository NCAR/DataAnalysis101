library( dataWorkshop)

# Intro to least squares 
# as an example work with the AudiA4 data
# 

data( AudiA4)
Y<- AudiA4$price
X<- AudiA4$mileage


plot( X,Y)
# a linear relationship might  more sense for mileage in the range [20K, 75K]
ind<-  (X>= 20000) & (X< 75000)    # & is logical 'and'
X1<- X[ind]
Y1<- Y[ind]
points( X1,Y1, col="red")

fit<- lm( Y1~X1)
# find residuals and fitted values by hand
#DONE
# confidence intervals for the coefficients of the fitted line.
#DONE
# The basic  least squares  diagnostic plot
# residuals always on the Y                         
plot( X1, fit$residuals) 
abline( h=0, col="grey")

plot(fit$fitted.values, fit$residuals )
abline( h=0, col="grey", lwd=2)

fitAll<- lm( Y ~ X)
plot(fitAll$fitted.values, fitAll$residuals )
plot(X, fitAll$residuals )
abline( h=0, col="grey", lwd=2)

# in hindsight check out scatterplot
plot( X,Y)
abline(fitAll$coefficients, col="red", lwd=2 )






# comparing the fit to using just a constant

# Q How does this diagnostic plot change when the full data is used?
# 

fitFull<- lm( Y~X )

# About standard deviations.

boxplot( Y1, fit$residuals)
sd( Y1)
sd( fit$residuals)

# rule of thumb for stand dev. 
# when data is approx normal (bell curve, Gaussian)

# +- 2 sd from the mean contains about 95% of the data

Y<- rnorm( 1000)
sd( Y)

ind<-  (Y <=  mean( Y) + 2* sd( Y) ) &
       (Y >=  mean( Y) - 2* sd( Y) )
sum( ind)/1000

# where does this magic 2 come from? 
# actually it is  closer to 1.96 ...

qnorm( .05/2, lower.tail=FALSE )





# measure of spread in Y1

# measure in residuals

 
#  







# this is what is called a monte carlo experiment

Beta1<- 

