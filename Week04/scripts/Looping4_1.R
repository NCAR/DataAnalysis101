## ----Section1 ----

#############################
#looping in R the for loop 
######################################

library( dataWorkshop)
data(AudiA4)

# here we will loop over years and fit a line that describes how 
# price depends on mileage.

# example of lm function 
x<- 1:10
y<- 5 + 2*x

lm( y~x)

set.seed( 122)
error<- rnorm( 10)*.2
y<- 5 + 2*x + error
lm( y ~ x)

# try this out on the A4 data

fit0<- lm( AudiA4$price ~ AudiA4$mileage )

plot(AudiA4$mileage,AudiA4$price )
abline( fit0$coefficients, col="orange2", lwd=3)

# fit each year separately 
# I only know how to do this with a for loop
hold<- matrix( NA, nrow=17, ncol=2)
yr<- 1999:2015
for ( k in 1:17){
  ind<- AudiA4$year == yr[k]
  if( sum(ind)> 20){
  fit<- lm( AudiA4$price ~ AudiA4$mileage, subset=ind )
  hold[k,]<- fit$coefficients
  }
}

# plotting all these
plot(AudiA4$mileage,AudiA4$price, pch=16, col="grey" )
for( k in 1:17){
  if( !is.na( hold[k,1])){
  abline( hold[k,], col="green2", lwd=2)
  }
}

##
# cutting into bigger groups. 

groups<- cut( AudiA4$year, 4)
groupID<- as.numeric( groups)
hold<- matrix( NA, nrow=4, ncol=2)
yr<- 1999:2015
for ( k in 1:4){
  ind<- groupID == k
    fit<- lm( AudiA4$price ~ AudiA4$mileage, subset=ind )
    hold[k,]<- fit$coefficients
}



# another example of looping
# drawing a mathematical surface

x<- seq( -3,3, length.out = 40)
y<- seq( -3,3,length.out=40)
Z<- matrix( NA, 40, 40)
for( i in 1:40){
  for( j in 1:40){
    Z[i,j]<- exp( - (x[i]^2 + 2*y[j]^2) )
  }
}  
  

image.plot( x,y,Z)

# for perspective need to adjust arguments so that it is 
# easier to interpret
par(mar=c(0,0,0,0))
persp( x,y, Z, phi=20, theta=45, shade=.3, col="grey80",
       border="grey")












