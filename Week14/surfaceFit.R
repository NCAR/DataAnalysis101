library( fields)
data(COmonthlyMet)
ls()
x<- CO.loc
y<- CO.tmin.MAM.climate
elev<- CO.elev
good<- !is.na( y)
x<- x[good,]
y<- y[good]
elev<- elev[good]


quilt.plot( x, y)
US( add=TRUE)
title("CO MAM average minimum temperatures")


fit1<- Tps( x, y)

surf<- predictSurface( fit1)
surfSE<-predictSurfaceSE( fit1)




plot( elev, y, xlab="elevation", ylab="MAM minimum (C) ")

X<- cbind( x, elev)
lmObj<- lm( y ~ lon + lat + elev, data=X )
summary( lmObj)

quilt.plot( x, lmObj$residuals)
US( add=TRUE, col="grey", lwd=2)


data( RMelevation) 
# elevations for the Rocky mountain area.

contour( elevGrid, levels=c( 2e3), add=TRUE, col="grey")

NGRID <- 250
COGrid<- fields.x.to.grid( x, nx=NGRID, ny=NGRID)
names(COGrid)<- c("x","y")
data( RMelevation) # elevations for the ROcky mountain area. 
elevGrid<- interp.surface.grid( RMelevation, COGrid )

fit1E<- spatialProcess( x,y, Z= elev, ngrid=20) 
surFull<- predictSurface( fit1E, grid.list= COGrid,
                          ZGrid= elevGrid)
image.plot( surFull)

surSmooth<-predictSurface( fit1E, grid.list= COGrid, drop.Z=TRUE)
image.plot( surSmooth)

# this does not work!
fit2<- Tps( x, y, Z=elev)
surf2<- predictSurface( fit2, grid.list=COGrid, Zgrid=elevGrid)
                        


