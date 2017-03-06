
library( dataWorkshop)

# fine tuning HW Quiz submission. Use  APPM2720   to begin subject line 
#  name on html/pdf/Rscript
# listing data sets.
# comments on for loops  and not using loops from Quiz1 
# e.g. converting temperatures=, converting dates. 

# trick using reshaping as a matrix to get a column of years. 



# Intro to least squares 
# as an example work with the AudiA4 data
# 

data( AudiA4)
Y<- AudiA4$price
X<- AudiA4$mileage

# finding the mean price the hard way!
# look at a sequence of points  (a) from 2000 to 40000
a<- seq( 2000, 40000,length.out=50)
SS<- rep( NA, 50)
for( k in 1:50){
  SS[k] <- sum(  (Y -a[k])^2 )
}
ind<- which.min( SS)
points( a[ind], SS[ind], col="magenta",cex=2)
# estimate of ahat is
aHat= a[ ind ]
mean( Y)


# analysis find out where the minimum is 


plot( X,Y)
# a linear relationship might  more sense for mileage in the range [20K, 75K]
# Subset the data to work with this example
subset<- (X<= 75000)&(X>=20000)
X1<- X[subset]
Y1<- Y[subset]


# brute force
# this is also incldued as a more substantial program and
# and an example of the image format
# vary slope a and intercept b  over 20K to 40K and -.4 to 0  50 points each and
# store the sum of squares in the matrix S
a <- seq( 20000, 60000, length.out=50)
b <- seq( -.6, 0, length.out=50)
SS<- matrix( NA, nrow=50, ncol=50)

for( i in 1:50){
  for( j in 1:50){
    SS[i,j] <- sum( 
            (Y1 -( a[i] + b[j]*X1) )^2 
      )
  }
}
library( fields)
image.plot(a, b, SS, col=two.colors())
min(SS)
contour(a, b, SS, add=TRUE, col="orange3", level= min(SS)*1.1 )

# finding the minimum
I<- row( SS)[ SS == min(SS)]
J<- col( SS)[ SS == min(SS)]
a[I]
b[J]

# check it out
plot( X1, Y1, pch=16)
abline( a[I], b[J], col="orange3", lwd=2)


# using a high tech R function 

fit<- lm( Y1 ~ X1)
fit$coefficients

summary( fit)

# using a low tech R function 
fit0<- lsfit( X1, Y1)
fit0$coefficients

# cheating 
Y1<- Y1/1000
X1<- X1/1000

# take a look at the surface


# add another contour close to the minimum


# the solution "by hand" using the LS formula -- see ISLR
#   b1Hat 
#   b0Hat 
   
# the solution using lm

# or  fit$lsfit( X1,Y1)

#Q2 plot the data and add the least squares line.

