################################################################################################
## Tornado locations in the US, Colorado and Iowa, (1950) 1996-2012
################################################################################################

library(fields)

load("TornadoExample.RData")

ls()

names(UStornado)

## class does not know about the attach function 

attach(UStornado)

ls()

head(UStornado$year)
head(year)

##
## Intro to the data
##

plot(table(year))

plot(table(Fscale))

plot(lat~lon,pch=19,cex=0.1)
US(add=TRUE,col="blue",lwd=2)

par(mfrow=c(1,2),mar=c(1,1,4,1))
plot(lat[year<1996]~lon[year<1996],pch=19,cex=0.1,main="Pre 1996",
  xaxt="n",yaxt="n",xlab="",ylab="")
plot(lat[year>=1996]~lon[year>=1996],pch=19,cex=0.1,main="Post 1996",
  xaxt="n",yaxt="n",xlab="",ylab="")

detach(UStornado)
rm(UStornado)

##
## Iowa and Colorado
##

## Iowa
par(mfrow=c(1,2),mar=c(1,1,4,1))
plot(IA.torn.loc,pch=19,cex=0.5,xlim=c(-97,-90),ylim=c(40,44))
US(add=TRUE,col="blue",lwd=2)
points(x=-91.5333,y=41.6667,col="red",pch=19)

## Colorado
plot(CO.torn.loc,pch=19,cex=0.5,xlim=c(-109,-102),ylim=c(37,41))
US(add=TRUE,col="blue",lwd=2)
points(x=-105.2519,y=40.0274,col="red",pch=19)
# how would we estimate the average number of tornados in Boulder?

##
## Some statistics: Expected number of tornados per century per square mile
##

boulder.loc <- cbind(-105.2519,40.0274)
IC.loc <- cbind(-91.5333,41.6667)

## Nearby locations to Boulder
dists <- rdist.earth(boulder.loc,CO.torn.loc,miles=TRUE)

quilt.plot(CO.torn.loc,dists)
points(boulder.loc,col="red",pch=19)

plot(CO.torn.loc,pch=19,cex=0.5,xlim=c(-109,-102),ylim=c(37,41))
US(add=TRUE,col="blue",lwd=2)
points(boulder.loc,col="red",pch=19)
points(CO.torn.loc[dists <= 100,],pch=19,cex=0.5,col="green")

## Some statistics
sum(dists <= 100) # total number 

sum(dists <= 100) / (pi * 100^2 * 17) # per year (why 17?)

100 * sum(dists <= 100) / (pi * 100^2 * 17) # per century

## Function to estimate expected number of tornados per century per square mile
expectation.torn <- function(new.loc,data.loc){
  dists <- rdist.earth(new.loc,data.loc,miles=TRUE)
  area <- pi*100^2
  number <- sum(dists <= 100)
  est <- number / (area * 17)
  est*100
}

e1 <- expectation.torn(new.loc=boulder.loc,data.loc=CO.torn.loc)
e2 <- expectation.torn(new.loc=IC.loc,data.loc=IA.torn.loc)

e2/e1

# problem: adjust the function expectation.torn for differing "bandwidths"
#          plot the ratio E(iowa city)/E(boulder) as a function of bandwidth

##
## Spatial maps of expected number
##

co.grd <- cbind(c(CO.elev.grd$x),c(CO.elev.grd$y))
plot(co.grd,pch=19,cex=0.1)
US(add=TRUE,col="blue")

## for loop version for multiple locations
expectation.torn <- function(new.loc,data.loc){
  dists <- rdist.earth(new.loc,data.loc,miles=TRUE)
  area <- pi*100^2
  number <- sum(dists <= 100)
  est <- number / (area * 17)
  est*100
}

ests.co <- NULL
for(i in 1:dim(co.grd)[1]){
  ests.co[i] <- expectation.torn(new.loc=rbind(co.grd[i,]),data.loc=CO.torn.loc)
  print(i)
}

## function version 2.0 for multiple locations
expectation.torn.v2 <- function(new.locs,data.loc,radius=100){
  dists <- rdist.earth(new.locs,data.loc)
  area <- pi*radius^2
  number <- apply(dists <= radius,1,sum)
  est <- number / (area * 17)
  est*100
}

ests.co.v2 <- expectation.torn.v2(new.locs=co.grd,data.loc=CO.torn.loc)

## are version 2 results the same?
range(ests.co - ests.co.v2)
# map
quilt.plot(co.grd,ests.co.v2)

## how do tornado locations compare to elevation in CO?
par(mfrow=c(1,2))
quilt.plot(co.grd,ests.co)
points(CO.torn.loc,pch=19,cex=0.5,col="white")
image.plot(CO.elev.grd$x,CO.elev.grd$y,CO.elev.grd$z,col=terrain.colors(256))
points(CO.torn.loc,pch=19,cex=0.25)

# problem: produce a similar analysis for Iowa, comapre against the elevation in Iowa
#          (there's elevation in Iowa?)

##
## Assess the spatial structure of the F scales
##

quilt.plot(CO.torn.loc,CO.torn.F)
quilt.plot(IA.torn.loc,IA.torn.F)

## For Boulder, what would be an average tornado's strength on the F scale?
strength.torn <- function(new.loc,data.loc){
  dists <- rdist.earth(new.loc,data.loc,miles=TRUE)
  nearby.Fs <- CO.torn.F[dists <= 100]
  mean(nearby.Fs)
}

strength.torn(new.loc=boulder.loc,data.loc=CO.torn.loc)

# problem: produce a map of average strength of tornados in Colorado
