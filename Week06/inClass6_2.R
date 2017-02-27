 # comments about colors and review of image verse raster formats
 # transparent<- rgb( 1,1,1, alpha=0)
 # converting to grey scales.

# three versions of specifying a color.
# 1) name
colors()[1:10]
#2) red green blue
 testColor<- rgb( .2, .3, .8)
 testColor2<- rgb( .2, .3, .8, alpha=1.0)
 plot( 1:10, 1:10, cex=15, pch=16, col=1:10)
 points( 2:9, 1:8, cex=10, pch=16, col=testColor2)
#3) hexadecimal

testColor3<- "#394DCCFF"
points(  1:8, 2:9,cex=10, pch=16, col=testColor3)

transparent<- rgb( 1,1,1, alpha=0)
# pallete

library( fields)
fields.style()
fields.style





library( dataWorkshop)
data(lennon)
I<- lennon/256

I<- I[40:240, ]
greyScale<- grey( seq(0,1,length.out=256))

image( I, col=greyScale)
library( raster)
library(jpeg)
IR<- as.raster(I)
IR2<- as.raster(t(I))
IR3<- IR2[256:1,]

dim( IR2)
set.panel(2,2)
par(mar=c(1,1,0,0))
image( I,col=greyScale, axes=FALSE)

plot( IR)
plot( IR2)
plot( IR3)

# finding edges in lennon image.
# select in a color range
ITest<- I
#ITest <-  as.numeric(I > .8) # does not work

ITest[I >.6 ] <- 1
ITest[I <= .6 ] <- 0

n1<- nrow( I)
n2<- ncol( I)
IH<- matrix( NA, nrow=n1, ncol=n2)
for(  i  in 2:n1){
  for( j in 1:n2){
    IH[i,j]<- I[i,j] - I[i-1,j]
  }
}
IV<- matrix( NA, nrow=n1, ncol=n2)
for(  i  in 1:n1){
  for( j in 2:n2){
    IV[i,j]<- I[i,j] - I[i,j-1]
  }
}

ID<- matrix( NA, nrow=n1, ncol=n2)
for(  i  in 2:n1){
  for( j in 2:n2){
    ID[i,j]<- I[i,j] - I[i-1,j-1]
  }
}

set.panel(2,2)
image(lennon, col=greyScale)
image( IH)
image( IV)
image( ID)


#
total<- sqrt( (IH)^2 + (IV)^2 + (ID)^2 )

image.plot( total)

# total seems to be picking up glasses edges
# how to make nice plot of this

par(mar=c(1,1,0,0))
image( I,col=greyScale, axes=FALSE)
 total2<- total
 total2 [total>.1] <-1
 total2 [total <= .1] <-0
 image( total2, col=c(transparent, "magenta"), add=TRUE)
 
 







# smoothing  the image
sI<- function( I, M=1){
smooth<- matrix( NA, n1, n2)

return( smooth)
}


noise<- lennon + matrix( 50*rnorm(n1*n2), n1, n2)

set.panel(2,2)
par( mar=c( 1,1,0,0))




