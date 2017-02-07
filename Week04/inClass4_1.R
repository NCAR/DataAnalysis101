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

plot(AudiA4$mileage,AudiA4$price, pch=16, col="grey" )
abline( fit0$coefficients, col="orange2", lwd=3)

# fit each year separately 
# I only know how to do this with a for loop
year<- 1999:2015
hold<- matrix(NA, nrow=17, ncol=2)
for ( k in 1:17){
  ind <- AudiA4$year == year[k]
  tempP<- AudiA4$price[  ind ]
  tempM<- AudiA4$mileage[  ind ]
  fit<- lm( tempP ~ tempM)
  hold[k, ] <- fit$coefficients
  cat( k, fit$coefficients, fill=TRUE)
}

# plotting all these
plot(AudiA4$mileage,AudiA4$price, pch=16, col="grey" )

abline( fit0$coefficients, col="orange2", lwd=3)
for( k in 1:17){
  abline( hold[k,1], hold[k,2], col="blue")
}

# cutting into bigger groups. 

groups<- cut( AudiA4$year, 4)
levels( groups)
groupID<- as.numeric( groups)

table( groupID)
table( AudiA4$color)

hold<- matrix(NA, nrow=4, ncol=2)
for ( k in 1:4){
  ind <- groupID == k
  tempP<- AudiA4$price[  ind ]
  tempM<- AudiA4$mileage[  ind ]
  fit<- lm( tempP ~ tempM)
  hold[k, ] <- fit$coefficients
  cat( k, fit$coefficients, fill=TRUE)
}

# plotting all these
plot(AudiA4$mileage,AudiA4$price, pch=16, col="grey" )

abline( fit0$coefficients, col="orange2", lwd=3)
for( k in 1:4){
  ind <- groupID == k
  tempP<- AudiA4$price[  ind ]
  tempM<- AudiA4$mileage[  ind ]
# add relevant points and lines with same color  
  points(tempM, tempP, col=k, pch=16 )
  abline( hold[k,1], hold[k,2], col= k, lwd=3 )
}

# NOTE the default order for the colors by index
# is given by   palette()



# another example of looping
# drawing a mathematical surface
# uses a double loop

x<- seq( -3,3, length.out = 40)
y<- seq( -3,3,length.out=40)
Z<- matrix( NA, 40, 40)
for( i in 1:40){
  cat(i, " ", fill=TRUE)
  for( j in 1:40){
    Z[i,j]<- exp( - (x[i]^2 + 2*y[j]^2) )
  }
}  

image.plot( x,y, Z)


# for perspective need to adjust arguments so that it is 
# easier to interpret
par( mar=c(0,0,0,0) )
persp( x,y, Z, phi=20, theta=45, shade=.3, col="grey80",
       border="grey")












