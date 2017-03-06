library( fields)
library( jpeg)
CUImage<- readJPEG("CUBoulder.jpg")

# first find a rectangle that includes bus stop logo
# Note makes this a bit smaller so it does confuse with surronding
# image.

par( mar=c(0,0,0,0))
plot(as.raster(CUImage))

ind<- locator( 2)
ix<- 323 : 349
iy<- 16 : 42 

# check on grey scale in image format
CUgrey<- apply( CUImage,c(1,2),"mean"  )
image( 300:376, 1:50,CUgrey[300:376,1:50], col=grey.colors(256))
rect( min( ix), min(iy), max( ix), max( iy), col="transparent", 
      border="magenta")

bStop<- CUImage[ix,iy,]  # a 27X27 pixel image.
plot( as.raster( bStop)) 

look<- matrix( NA, 376, 420)
n1<- dim( bStop)[1]
M<- (n1-1)/2  # this should be 10
window<- -M:M

for(  i in (M+1): (376-M-1) ){
  for( j in (M+1):(420-M -1) ){
    look[i,j]<- mean(
      (CUImage[i+window, j+ window,1] - bStop[,,1])^2 +
      (CUImage[i+window, j+ window,2] - bStop[,,2])^2 +
      (CUImage[i+window, j+ window,3] - bStop[,,3])^2
    )
  }
}



 image.plot( 1:376, 1:420,look, zlim=c( 0, .2))
J<-I<- vector()
 for(  i in (M+1): (376-M-1) ){
   for( j in (M+1):(420-M -1) ){
     if( !is.na(look[i,j])){
       if( look[i,j]< .1){
         I<- c( I, i)
         J<- c( J, j)
       }
     }
   }
 }

