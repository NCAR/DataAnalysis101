# read in the Boulder data 
load( "BoulderTemperature.rda")
# Or use:
#library( dataWorkshop)
# data(BoulderTemperature)

# some examples of subsetting and conversions
BT1<-BoulderTemperature$jun
YearLabels<- row.names(BoulderTemperature)
Year<- as.numeric(YearLabels)

##########################
# a scatterplot ( also a time series plot)
plot( Year, BT1)

# changing size of  plotting symbol  e.g. .5= half size 2= twice size
plot(Year, BT1, cex=.5)

# changing the plotting symbol
plot( Year, BT1, pch=16)

# changing the color
plot( Year, BT1, pch=16, col="magenta")

# broken lines 
plot( Year, BT1, type="l")

# good plots should have labels and a title
plot(Year, BT1, type="l", xlab="Year", ylab="Temperature (F)")
title("Boulder mean June Temperatures")
# horizontal line at 70 degrees
abline( h= 70)

# Q add a line at the mean of these temperatures

# Q add the line but make it blue

# Q  plot horizontal lines at the 10 and 90 quantiles.

# Q Use the points function to plot the data points that are above the 90 quantile

# Q Use the lines function to add the July temperatures in another color

# This last plot could be done in one step using
#     matplot( Year, BoulderTemperature[,6:7], type="l")



# WorldBank data on CO2 emissions per capita
load("WorldBankCO2.rda")

WB<- WorldBankCO2

#Q how do you look at the first row on these data?
#Q how would you extract the country names?

#Q make a scatterplot of GDP.cap and CO2.cap
#     (wealth of country verses the amount of CO2 emitted)

#Q Fix this plot by log transformations of both variables!

# where we are going ...

x<- log10(WB$GDP.cap )
y<- log10( WB$CO2.cap)
plot( x,y, pch=16, col="grey", xlab="log 10 GDP", ylab="log 10 CO2")

# adding the conutry names to the larger values
ind<- (y >=6)
# ind is now a data set of TRUE and FALSE values the same length as y

# add some labels
text( x[ind], y[ind], labels= row.names( WB)[ind])

# or try redrawing with 
#   text( x[ind], y[ind], labels= row.names( WB)[ind], adj=1.1)


# an elegant way to do the plot using the ~ and the log option
plot(CO2.cap ~ GDP.cap, data=WB, log="xy", xlab="GDP", ylab="CO2")
text( x[ind], y[ind], labels= row.names( WB)[ind], adj=1.1)

# fitting a smooth statistical curve through the data
# you will have to use the fields library
x<- log10(WB$GDP.cap )
y<- log10( WB$CO2.cap)
plot( x,y, pch=16, col="grey", xlab="log 10 GDP", ylab="log 10 CO2")

library( fields) 
fit<- sreg( x,y) # spline smoother
lines( fit$predicted, col="orange4", lwd=4)


###################################
#  Histograms
###################################
#histogram of the temperatures
hist( BT1)
# add a better label
hist(BT1, xlab="Degrees F", main="Boulder average June Temperatures 1897-2012")
# more classes
hist(BT1, nclass=16,
     xlab="Degrees F", main="Boulder average June Temperatures 1897-2012")
# locate the mean with a red vertical line
Bmean<- mean(BT1, na.rm=TRUE)

abline( v=Bmean, col="red", lwd=4)

# generate a sample from a Gaussian  (aka Normal) distribution  and 
# add the theorectical probablity function

# 5000 samples
Y<- rnorm( 5000)
hist( Y, prob=TRUE, col="green4")

x<- seq( -3,3,,100)
yDensity<- dnorm( x)
lines( x, yDensity, col="grey", lwd=3)















