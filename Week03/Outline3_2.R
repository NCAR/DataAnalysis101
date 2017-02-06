# load two libraries
library( dataWorkshop)
library( fields)

# using boxplots
set.seed( 223) # set the random seed so we all get the same sample (223 is arbitrary)  
y1<- runif(10) 
y2<- y1 + 5
y3 <- y1*2
y4<- y1
y4[1] <- 5
exampleData<- cbind( y1,y2,y3,y4)
boxplot( exampleData)


# WorldBank data on CO2 emissions per capita
#load("WorldBankCO2.rda")
data("WorldBankCO2")

WB<- WorldBankCO2
WB[1,]

tail( WB)

#Q make a scatterplot of GDP.cap and CO2.cap
#     (wealth of country verses the amount of CO2 emitted)

plot( WB$GDP.cap, WB$CO2.cap)
# plot hard to interpret

#Q how do you look at the first row on these data?
#Q how would you extract the country names?

#Q Fix this plot by log transformations of both variables!

# where we are going ...

x<- log10(WB$GDP.cap )
y<- log10( WB$CO2.cap)

plot( x,y, xlab="GDP", ylab="CO2")
title( "CO2 emissions for 75 largest countries")
which.max( y) # its 69
WB[69,]

ind <- y >= 6.0
# the big guys
WB[ind, ]
  
# adding the country names to the larger values
 tempNames<- rownames( WB)
 tempNames<- tempNames[ind]
 
text( x[ind], y[ind], labels= tempNames,
      adj=1, cex=.5 )


# add some labels


# an elegant way to do the plot using the ~ and the log option

# fitting a smooth statistical curve through the data
# you will have to use the fields library
x<- log10(WB$GDP.cap )
y<- log10( WB$CO2.cap)
plot( x,y, pch=16, col="grey", xlab="log 10 GDP", ylab="log 10 CO2")

library( fields) 
fit<- sreg( x,y) # spline smoother 
lines( fit$predicted, col="orange4", lwd=4)
#
# more on looking at variables
# pairs( WB)
# what about say Pop.mid, CO2.cap at the same time
library( fields)
X<- cbind( log10(WB$GDP.cap), WB$Pop.mid)
Y<- log10( WB$CO2.cap)
quilt.plot(X,Y, xlab="log GDP.cap", ylab="Pop.mid")

# Connecing with lecture 3_2 on matrices
#
# where are the matrices ??? some R surgery ...
look<- as.image( Z=Y, x=X)
image.plot( look,xlab="log GDP.cap", ylab="Pop.mid")

# check out look$z



###################################
#  Histograms
###################################
#histogram of the temperatures
data(BoulderTemperature)
BT1<- BoulderTemperature$jun
hist( BT1)
# comare to 
boxplot( BT1)

# add more classes

# locate the mean with a red vertical line

# generate a sample from a Gaussian  (aka Normal) distribution
# 500 samples
set.seed(123)# what does this do?
Y<- rnorm( 500)
hist( Y, prob=TRUE, col="green4")
# the required plot in any probability math class!
# superimposing theoretical "histogram" on top of
# sample
x<- seq( -3,3,,100)
yDensity<- dnorm( x)
lines( x, yDensity, col="grey", lwd=3)
# 
