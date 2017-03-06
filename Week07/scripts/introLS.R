
library( dataWorkshop)

# Intro to least squares 
# as an example work with the AudiA4 data
# 

data( AudiA4)
Y<- AudiA4$price
X<- AudiA4$mileage

# finding the mean price the hard way!

S<- rep( NA, 50)
a<- seq( from= 2000, to = 40000, length.out=50)
for( k in 1:50){
  S[k] <- sum( abs(Y-a[k]) )
}
# analysis
plot( a, S, type="l")
ind<- which.min(S)
abline( v= a[ind], lwd=2, col="magenta")

abline( v= mean(Y), lwd=2)

# Q1 modify the program to find the median 
# (recall absolute value function in R is abs)

plot( X,Y)
# a linear relationship might  more sense for mileage in the range [20K, 75K]
ind<-  (X>= 20000) & (X< 75000)    # & is logical 'and'
X1<- X[ind]
Y1<- Y[ind]
points( X1,Y1, col="red")

# brute force
# this is also incldued as a more substantial program and
# and an example of the image format

S<- array( NA,c(50, 50))
b0<- seq( from = 20000, to = 40000, length.out = 50)
b1<- seq( from = -.4,   to = 0,     length.out = 50)
for( k in 1:50){
   for( j in 1:50){
  S[j,k] <- sum( (Y1- (b0[j] + b1[k]*X1) )^2 )
   }
}


# take a look at the surface
image.plot(b0, b1, S, ylab="slope", xlab="intercept")

# add another contour close to the minimum
contour(b0, b1, S, add=TRUE, 
        col="grey80", levels= c(.25,.3,.5, 1:4)*1e10,
        lwd=3, drawlabels= FALSE)
# the solution "by hand" using the LS formula -- see ISLR
   b1Hat =  sum( (Y1- mean(Y1)) * (X1-mean(X1)) ) / sum( (X1- mean(X1))^2)
   b0Hat <-  mean(Y1) - b1Hat* mean(X1)
   
# the solution using lm
fit<- lm(Y1 ~ X1 )
# or  fit$lsfit( X1,Y1)
coef<- fit$coefficients
points( coef[1], coef[2], col="magenta", pch=16)

#Q2 plot the data and add the least squares line.



# for fun try these fields functions:
p.out<- drape.plot(b0, b1, S, border=NA, col=two.colors())
pushpin(coef[1], coef[2], min(S), p.out=p.out)

#Q3 How does the surface change if you look at least absolute values?
# e.g.  S[j,k] =  mean( abs(Y1- b0[j] - b1[k]*X1 ) )

  






