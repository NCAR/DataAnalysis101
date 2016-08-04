library( dataWorkshop)

x<- seq( 0,1,,40)
y<- seq( 0,1,,40)

z<- matrix( NA, 40,40)

for( j in 1:40){
  for( k in 1:40){
    z[j,k] <- (x[j]-.5)^2 - (y[k]-.5)^2
    
  }
}

image.plot( x, y, z)

obj<- list( x=x, y=y, z=z)

persp( x,y,z)

persp( x,y,z, theta=40, phi=30, shade=.9, col="green",border=NA)

library( rgl)
surface3d( x,y,z)

col<- color.scale( z, tim.colors(256) )

col<- color.scale( z, col=terrain.colors(10) )

surface3d( x,y,z, color=col)
#####

gridList<- list( x= x, y=y)
gridList

xyGrid<- make.surface.grid( gridList)

z0<- (xyGrid[,1]-.5)^2 -  (xyGrid[,2]-.5)^2

# showing off R coding 
z0<-  (xyGrid -.5)^2
z0<-  z0[,1]- z0[,2]

obj<- as.surface( gridList, z0)

names( obj)

image.plot( obj)

# back to CO data
data(COmonthlyMet)
x<- CO.loc
y<- CO.tmin.MAM.climate

good<- !is.na( y)
x<- x[good,]
y<- y[good]
elev<- CO.elev[good]
quilt.plot( x, y)
quilt.plot( x, elev)

fit<- spatialProcess( x, y, Z=elev)

fit1<- spatialProcess( x, y, Z=elev, ngrid=20)

fit0<- spatialProcess( x, y)
surface( fit0)
out0<- predictSurface( fit0)
image.plot(out0)

data( RMelevation)
COGrid<- list(x= out0$x, y= out0$y )
COElev<- interp.surface.grid(RMelevation, COGrid )

out1<- predictSurface( fit1, grid.list=COGrid, 
                       ZGrid=COElev )
out2<- predictSurface( fit1, grid.list=COGrid, 
                       drop.Z=TRUE )

out3<- predictSurface( fit1, grid.list=COGrid, 
                       ZGrid=COElev, just.fixed=TRUE )


set.panel(2,2)

surface( fit0)

image.plot( out1)
image.plot( out2)
image.plot( out3)







































