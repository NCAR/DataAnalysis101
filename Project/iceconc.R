library( fields)
library( mapproj)
load( "icedata.RData")

dim( iceconc)
image.plot( iceconc[,,1])

map( "world", projection="stereographic", ylim =c( 70,90) )

x.S<- mapproject( c(lon), c(lat), proj="")

# the proj="" means to use the projecion from the previous map call 
# map( "world", projection="stereographic", ylim =c( 70,90) )
# you can recover the exact at information in the "secret" data set
# .Last.projection and just give this information directly to the map function 

save.projection<- .Last.projection

x1<- matrix( x.S$x,304 ,448 )
x2<- matrix( x.S$y,304 ,448 )

test<- iceconc[,,1]
# reset what in not ice to NA (plots as white)
test[ test<=0]<- NA

image.plot( x1,x2, test, xlim=c(-.5,.4), ylim =c( -.4,.5))
map( "world", proj="", add=TRUE, col="green4", lwd=2)


# this does _not_ work -- not sure why!
##  map( "world", proj=save.projection$projection, 
#     parameters= save.projection$paramters, 
#     orientation= save.projection$orientation,
#      add=TRUE, col="green4", lwd=2)

# time series plot:

time<- (1: 422) 
plot( time, iceconc[200,205,])

# by month  (note month coding might be shifted  e.g 11==September)

boxplot(iceconc[200,205,] ~  time%%12 )




