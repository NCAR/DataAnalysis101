set.seed(145)
runif(10)

set.seed(123)
N<-100
X<- rnorm(N)

mean( X)
sd(X)

errors<- rnorm( N, mean=0, sd=.5)
Y <- 2 + 3*X +errors

plot( X,Y)

fit<- lm(Y ~ X)

set.seed(123)
N<-4
X<- rnorm(N)
errors<- rnorm( N, mean=0, sd=.5)
Y <- 2 + 3*X +errors
lm(Y ~ X)

N<- 2e6
X<- rnorm(N)
errors<- rnorm( N, mean=0, sd=.5)
Y <- 2 + 3*X +errors
system.time(  lm(Y~X))

testFit <- function(X){
  N<- length(X)
  errors<- rnorm( N, mean=0, sd=.5)
  Y<- 2 + 3*X +errors
  fit<- lm(Y~X)
  return( fit$coefficients)
}

hold<- array( NA, c(250,2))

for( k in 1:250){
  hold[k,]<- testFit(X)
}

library( fields)







