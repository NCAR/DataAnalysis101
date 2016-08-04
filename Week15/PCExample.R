
library( dataWorkshop)

data( "miniTriathlon")

Y<-  miniTriathlon

library( rgl)
plot3d( Y)

# example an outer
#
look<- outer(1:3, c(4,5,10,20), "*")
look<- outer( rnorm(10), rnorm(3),"*")

beta<- rep(NA,3)
X<- rnorm( 110)

for( I in 1:15){
for( j in 1:3){
  beta[j]<- lm( Y[,j]~ X - 1)$coefficient
}
beta<- beta/sqrt(sum( beta^2))
print( beta)
for( k in 1:110){
  X[k]<- lm( Y[k,] ~ beta - 1)$coefficient
}
}

# approx table 
look0<- outer( X, beta, "*")

plot3d( Y)
plot3d( look0, col="red", add=TRUE)



look<-fitPC( Y)
plot3d( Y)
plot3d( look$fitted.values, col="red", add=TRUE)


look2<-fitPC( Y- look$fitted.values, 20)

plot3d( look$fitted.values + look2$fitted.values,
                col="magenta", add=TRUE)

Yapprox<- look$fitted.values + look2$fitted.values
set.panel( 2,3)

for( k in 1:3){
  plot(Y[,k], look$fitted.values[,k] )
}
for( k in 1:3){
plot(Y[,k], Yapprox[,k] )
}

look$beta
look2$beta














fitPC<- function( Y, niter=5){
m<- nrow( Y)
n<- ncol(Y)
X<- rnorm( nrow(Y))
beta<- betaOLD<- rep( 0, n)
for( I in 1:niter){
 for( k in 1:n){
   beta[k]<- lm( Y[,k]~ X-1) $coefficients
 }
 beta<- beta/ sqrt( sum( beta^2) )
print( beta)
print( sqrt( mean( (beta- betaOLD)^2)))
betaOLD<-beta
for( j in 1:m){ 
   X[j] <- lm( c(Y[j,]) ~ beta - 1)$coefficients
 }
}
pred<-  outer( X, beta, "*")
return( list( beta=beta, X=X, fitted.values= pred))
}


look1<- fitPC( Y)
look2<- fitPC( Y - look$fitted.values)
set.panel(2,3)
for( I in 1:3)     {
plot(Y[,I],look1$fitted.values[,I] )
} 
for( I in 1:3)     {
  plot(Y[,I], look2$fitted.values[,I] + look1$fitted.values[,I]  )
} 


          
# using advanced matrix methods               
look3<-svd( Y)
dS<- c( look3$d[1:2], 0)
test<- look3$u%*%diag( dS)%*% t(look3$v)
for( I in 1:3)     {    
  plot(Y[,I],test[,I])         
}
##############

data(COmonthlyMet)

Y<- apply( CO.tmin, c( 2,3), "mean", na.rm=TRUE)

Y<- aperm( Y, c(2,1))
ind<- rowSums(is.na(Y))
Y<- Y[ind==0,]
Yc<- scale( Y, center=TRUE, scale=FALSE)
COseason<- colMeans( Yc)
loc<- CO.loc[ind==0,]
elev<- CO.elev[ind==0]
look1<- fitPC( Y)
look2<- fitPC( Y- look1$fitted.values)


set.panel(3,2)
matplot(1:12, cbind( look1$beta, look2$beta), xlab="months", ylab="beta", 
          type="l" )

plot( look1$X, look2$X)
# point 183 may be an outlier

quilt.plot( loc, look1$X)
surface( Tps( loc, look1$X), type="I", col=two.colors())
quilt.plot( loc, look2$X)
surface( Tps( loc, look2$X), type="I", col=two.colors())
#quilt.plot( cbind(look1$X, look2$X), elev)

# examining 183, 57 239
matplot( 1:12, t(Y), type="l", lty=1, col="grey")
matlines( 1:12, t( Y[c(183,57, 239),] ), col="red")

# showing power of the rank 2 approximation to the matrix
Yapprox<- look1$fitted.values + look2$fitted.values
matplot( 1:12, t(Yapprox), type="l", lty=1, col="grey")
matlines( 1:12, t( Yapprox[c(183,57, 239),] ), col="red")




# synthetic example
set.seed(123)
sqrt(mean( U^2))
U0<- matrix( rnorm(2000), 1000,2)
ind<- sqrt((U0[,1]^2 + U0[,2]^2)) >= .5
U0<- U0[ind,]
U<- cbind( U0[,1],U0[,1]- U0[,2], U0[,1] + 2*U0[,2] )

look1<- fitPC( U)
sqrt(mean( (look1$fitted.values- U)^2))

look2<- fitPC( U- look1$fitted.values)
sqrt(mean( ( (look1$fitted.values + look2$fitted.values )- U)^2))







