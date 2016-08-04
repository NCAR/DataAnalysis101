# load libraries (install first if need be)
library(maps)
library(fields)
library(animation)
library(mapproj)

# Set working directory and load data
getwd()
setwd("/Users/csmirni/Documents/databootcamp")
load("seaice.Rdata")
attach(seaice)

# Get basic information about the dataset
summary(seaice)

dim(lat)
dim(lon)
dim(conc)
length(dates)

range(lat)
range(lon)
range(conc)
summary(conc)
head(dates)

# Look more closely at conc
hist(conc)

# Snapshot of one month
image.plot(lon, lat, conc[,,1])

# change projection
?mapproject
coord <- mapproject (lon, lat, proj = "azequidistant", orientation = c(90,0,0))           
summary(coord)
lapply(coord, summary)
lapply(coord, length)

# make coord$x and coord$y into matrices
x.mat <- matrix( coord$x, nrow = 152, ncol = 224)
y.mat <- matrix( coord$y, nrow = 152, ncol = 224 )

# Snapshot of first month
image.plot(x.mat, y.mat, conc[,,1])

# change color scale (blue to white)
?designer.colors
coltab<- designer.colors(col=c("#0D50B2",  "#6BAED6", "#FFFFFF"),
                         x= c( 0,0.5, 1) )
image.plot(x.mat, y.mat, conc[,,1], col = coltab)

# add country borders
map( "world", ylim = c(45,90), projection = "azequidistant",
     orientation = c(90,0,0), col = "black", lwd = 1, add = TRUE )

# add title
title( main = paste("Sea Ice Concentration", dates[1]))

# make a beautiful plot of month 1 (turn off axes and axes labels)
map( "world", ylim = c(55,90), projection = "azequidistant",
     orientation = c(90,0,0), col = "#0C9A61", fill = TRUE,
     lwd = 1, bg="#0D50B2")
image.plot( x.mat, y.mat,conc[,,1], col = coltab, 
            xaxt = "n", yaxt = "n", ann = FALSE, 
            horizontal=TRUE, add=TRUE )
map( "world", ylim = c(55,90), projection = "azequidistant",
     orientation = c(90,0,0), col = "#0C9A61", fill = TRUE,
     lwd = 1, bg="#0D50B2", add=TRUE)
title( main = paste("Sea Ice Concentration", dates[1]), col.main = "white")

# Plot the time series
# replace flags (negative values) with NAs
sum(conc<0)
conc.noneg <- ifelse(conc < 0, NA, conc)
dim(conc.noneg)
sum(conc.noneg<0, na.rm = TRUE)
sum(is.na(conc.noneg))
conc.ts <- apply(conc.noneg, 3, mean, na.rm=TRUE)
plot(1:422, conc.ts, type = "l", xlab="month", ylab="mean conc")
x = 1:422
abline(lm(conc.ts~x), col="red", lwd=2)

# Explore animation package
?saveVideo
?saveMovie
?saveGIF

# write a loop to plot 3 months
for (ii in 1:3){
  map( "world", ylim = c(55,90), projection = "azequidistant",
       orientation = c(90,0,0), col = "#0C9A61", fill = TRUE,
       lwd = 1, bg="#0D50B2")
  image.plot( x.mat, y.mat,conc[,,ii], col = coltab, 
              xaxt = "n", yaxt = "n", ann = FALSE, 
              horizontal=TRUE, add=TRUE )
  map( "world", ylim = c(55,90), projection = "azequidistant",
       orientation = c(90,0,0), col = "#0C9A61", fill = TRUE,
       lwd = 1, bg="#0D50B2", add=TRUE)
  title( main = paste("Sea Ice Concentration", dates[ii]), col.main = "white")
}

# turn that loop into a function
mapimages.f <- function(conc, timeind, xmat, ymat, dates){
  for (ii in timeind){
    map( "world", ylim = c(55,90), projection = "azequidistant",
         orientation = c(90,0,0), col = "#0C9A61", fill = TRUE,
         lwd = 1, bg="#0D50B2")
    image.plot( x.mat, y.mat,conc[,,ii], col = coltab, 
                xaxt = "n", yaxt = "n", ann = FALSE, 
                horizontal=TRUE, add=TRUE )
    map( "world", ylim = c(55,90), projection = "azequidistant",
         orientation = c(90,0,0), col = "#0C9A61", fill = TRUE,
         lwd = 1, bg="#0D50B2", add=TRUE)
    title( main = paste("Sea Ice Concentration", dates[ii]), col.main = "white")
  }
}

getwd()
setwd("/Users/csmirni/Desktop")

# test it with shorter version--only 12 months worth
saveVideo( mapimages.f( conc, 1:12, x.mat, y.mat, dates ), 
           interval = .3, video.name = "ice1_12.mp4" )

# make video of full time period
saveVideo( mapimages.f( conc, 1:422, x.mat, y.mat, dates ), 
           interval = .3, video.name = "ice_all.mp4" )

# make a video of only September
ind.S <- seq(11,422,12)
saveVideo( mapimages.f(conc, ind.S, x.mat, y.mat, dates), 
           interval = .3, video.name = "ice_S.mp4" )

# make a video of only summer (JJAS)
ind.JJAS <- sort( c( seq(8,422,12), seq(9,422,12), 
                   seq(10,422,12), seq(11,422,12)))
saveVideo( mapimages.f(conc, ind.JJAS, x.mat, y.mat, dates), 
           interval = .3, video.name = "ice_JJAS.mp4" )


# Find the mean over time at each point
conc.mn <- apply(conc, 1:2, mean)
dim(conc.mn)
map( "world", ylim = c(55,90), projection = "azequidistant",
     orientation = c(90,0,0), col = "#0C9A61", fill = TRUE,
     lwd = 1, bg="#0D50B2")
image.plot( x.mat, y.mat,conc[,,1], col = coltab, 
            xaxt = "n", yaxt = "n", ann = FALSE, 
            horizontal=TRUE, add=TRUE )
map( "world", ylim = c(55,90), projection = "azequidistant",
     orientation = c(90,0,0), col = "#0C9A61", fill = TRUE,
     lwd = 1, bg="#0D50B2", add=TRUE)
title( main = "Mean Sea Ice Concentration", col.main = "white")

