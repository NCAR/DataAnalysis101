# working with the image format

x<- seq( 0,1,,40)
y<- seq( 0,1,,40)

z<- matrix( NA, 40,40)

for( j in 1:40){
  for(k in 1:40 ){
    z[j,k]<- (x[j]-.5)^2 -  (y[k]- .5)^2
  }
}

image.plot( x,y, z)

# or 
obj<- list( x=x, y=y, z=z)
image.plot( obj)

persp( x,y,z)

persp( x,y,z, theta = 40, phi=30, shade =.5,
       border=NA)

library( rgl)

surface3d( x,y, z)

col<- color.scale(z, tim.colors(256) )
surface3d( x,y, z, color=col)

# adding contours

image.plot( x,y, z)
contour( x,y,z, add=TRUE, col="grey")

# creating grids
gridList<- list( x= seq( 0,1,,20), 
                 y = seq( 0,1,,20))

xyGrid<- make.surface.grid( gridList)
plot( xyGrid)
z<- (xyGrid[,1] -.5)^2 - (xyGrid[,2] -.5)^2

obj1<- as.surface( xyGrid, z)
image.plot( obj1)



# example random surfaces

grid<- list( x= seq( 0,5,,100), y= seq(0,5,,100)) 
set.seed(123)
obj<-matern.image.cov( grid=grid, theta=.5, smoothness=.5, setup=TRUE)
look<- sim.rf( obj)
image.plot( look)

set.seed(123)
obj<-matern.image.cov( grid=grid, theta=1.0, smoothness=.5, setup=TRUE)
look<- sim.rf( obj)
image.plot( look)

set.seed(123)
obj<-matern.image.cov( grid=grid, theta=.5, smoothness=1.0, setup=TRUE)
look<- sim.rf( obj)
image.plot( look)








