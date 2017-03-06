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

# confidence intervals for the coefficients of the fitted line.

# The basic  least squares  diagnostic plot
                                        #

# comparing the fit to using just a constant

# Q How does this diagnostic plot change when the full data is used?
# 

fitFull<- lm( Y~X )

# About standard deviations.

# measure of spread in Y1

# measure in residuals

 
#  







# this is what is called a monte carlo experiment

Beta1<- 

