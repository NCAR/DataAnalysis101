# read in the Boulder data 
#load( "BoulderTemperature.rda")
# Or use:
library( dataWorkshop)
data(BoulderTemperature)

# some examples of subsetting and conversions
June<- BoulderTemperature[ ,6]

June<- BoulderTemperature$jun

June<- BoulderTemperature[,"jun"]
years<- 1897 : 2014
years <- seq( 1897, 2014,by=1)

years<- rownames( BoulderTemperature)
years<- strtoi(years)
# or 
years<- rownames( BoulderTemperature)
years<- as.numeric(years)
# extracting the year as a numerical variable, creating June separately

##########################
# a scatterplot (also called a time series plot)
plot( years, June)
plot( years, June, cex=4.0)
# changing size of  plotting symbol  e.g. .5= half size 2= twice size


# changing the plotting symbol
help( plot)

plot( years, June, pch =16, col="darkgreen", cex=2)
plot( years, June, pch =16, col="darkgreen", cex=2,
      xlab="Years", ylab="June mean temperature (F)",
      main=" Boulder historical temperatures")

plot( years, June, pch =16, col="darkgreen", cex=2,
      xlab="Years", ylab="June mean temperature (F)")
title("Boulder historical temperatures", cex=2.5)

# changing the color

# broken lines 


# good plots should have labels and a title


# horizontal line at 70 degrees
abline( h= 70, col="red")

# Q add a line at the mean of these temperatures?

abline( h = mean(June, na.rm=TRUE), col="magenta",
        lwd =2)
juneMean<- mean(June, na.rm=TRUE)
abline( h = juneMean, col="magenta",
        lwd =2)

# Q add the line but make it blue
# Q  plot horizontal lines at the 10 and 90 quantiles.
# Q Use the points function to plot the data points that are above the 90 quantile
# Q Use the lines function to add the July temperatures in another color

# This last plot could be done in one step using
#     matplot( Year, BoulderTemperature[,6:7], type="l")













