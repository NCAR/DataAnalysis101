
library( dataWorkshop)
data(lennon)

# finding edges in lennon image.
n1<- nrow( lennon)
n2<- ncol( lennon)
edgeH<- matrix( NA, n1, n2)
for( i in 2: n1){
  for( j in 1:n2 ){
    edgeH[i,j] <- lennon[i,j]- lennon[i-1,j]
  }
}

edgeV<- matrix( NA, n1, n2)
for( i in 1: n1){
  for( j in 2:n2 ){
    edgeV[i,j] <- lennon[i,j]- lennon[i,j-1]
  }
}
edgeD<- matrix( NA, n1, n2)
for( i in 2: n1){
  for( j in 2:n2 ){
    edgeD[i,j] <- lennon[i,j]- lennon[i-1,j-1]
  }
}

total<- sqrt( (edgeH)^2 + (edgeV)^2 + (edgeD)^2 )
total2<- total > quantile(c(total), .95, na.rm=TRUE)
transparent<- rgb( 1,1,1, alpha=0)
greyScale<- grey.colors( 256)
image( lennon, col=greyScale)
image( total2, col=c("transparent", "magenta"), add=TRUE)

# smooth the image
sI<- function( I){
smooth<- matrix( NA, n1, n2)
      ind1<- c(0,-1,-1,1,1)
      ind2<- c( 0,1,1,-1,-1)
for( i in 2:(n1-1) ) {
  for( j in 2:(n2-1) ){
     ix<- ind1 + i
     iy<- ind2 + j
#    smooth[i,j] <-   median( I[ cbind(ix,iy) ], na.rm=TRUE)
     smooth[i,j] <-   mean( I[ cbind(ix,iy) ], na.rm=TRUE)
  }
}
return( smooth)
}

look<- sI( lennon)
look2<- sI( look)
look3<- sI( look2)
look4<- sI( look3)

set.panel(2,2)
par( mar=c(1,1,0,0))
image( lennon, col=greyScale, axes=FALSE, xlab="", ylab="")

image( look4, col=greyScale, axes=FALSE, xlab="", ylab="")

image( look4 - lennon, col= tim.colors(),
       axes=FALSE, xlab="", ylab="")

noise<- lennon + matrix( 256* b, n1, n2)

set.panel(2,2)
par( mar=c( 1,1,0,0))
image(lennon,col=greyScale,
      axes=FALSE, xlab="", ylab="")
image(noise,col=greyScale,
       axes=FALSE, xlab="", ylab="")

image( sI(noise),col=greyScale,
       axes=FALSE, xlab="", ylab="")
image( sI(sI(noise)),col=greyScale,
       axes=FALSE, xlab="", ylab="")

library(jpeg)
look<- readJPEG("CUNorlinQuad.jpg")
plot( as.raster( look))

evI<- function(I){
  n1<- nrow( I)
  n2<- ncol(I)
  edgeV<- matrix( NA, n1, n2)
  for( i in 1: n1){
    for( j in 2:n2 ){
      edgeV[i,j] <-I[i,j]- I[i,j-1]
    }
  }
  return( edgeV)
}

