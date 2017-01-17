### simulating a statistical model
library( fields)


set.seed(122)
N<- 100
X<- rnorm(N)
errors<- rnorm( N, mean=0, sd=.5 )
Y<- 2 + 3*X + errors
fit <- lm( Y~X)
summary( fit)


# estimate of standard deviation of the errors
sd(fit$residuals ) 
# exact answer  (adjust by n-2) is ...
   sd(fit$residuals ) *  sqrt( (N-1)/(N-2) )
   summary( fit)$sigma


testFit<- function(X){
  N<- length( X)
  errors<- rnorm( N, mean=0, sd=.5 )
  Y<- 2 + 3*X + errors
  fit<-lm( Y~X) 
  return(fit$coefficients)
}


# little Monte Carlo run of 50 trials
hold<- array( NA, c(250,2))
for ( k in 1:250){
  hold[k,]<- testFit(X)
}

# Q How does the answer change as you increase or decrease the sample size (N) ?




# compare monte carlo to lm summary
errors<- rnorm( N, mean=0, sd=.5 )
Y<- 2 + 3*X + errors
fit <- lm( Y~X)
look<-summary( fit)
#SE for beta1
look$coefficients[2,2]
# compare to 
sd( hold[,2])




### supplement adding the theoretical normal distribution (density function) to a histogram

 Y<- rnorm( 1e4, mean=2, sd=.5)
 xgrid<- seq(-4, 4,length.out=500)
 ycurve<- dnorm( xgrid,mean=2, sd=.5)
 
 hist(Y, prob=TRUE, col="green4")
 lines( xgrid, ycurve, col="red", lwd=2)
 
 

