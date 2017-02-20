

convertTime<- function(tt){
  N<- length( tt)
  minutes<- rep( NA, N)
  for( k in 1:N){
   minutes[k]<- convertSingleTime( tt[k])
   }
return( minutes)
 
}

convertSingleTime<- function(ts){
    tTemp <- as.character(ts)
# the next function returns a list instead of vector so convert it.    
  x<- unlist(strsplit( tTemp, ":"))
  mn <- as.numeric(x[1]) # this works even if minutes are say "04"
  sec<- as.numeric(x[2])
  return( mn + sec/60)
}


# this is a hybrid between the running mean smoother and the
# example fitting straight lines to subsets. 
# I like using the fitted lines because it will handle points at the ends
# of the data better
mySmooth3 <- function(x,y, xnew = sort(x), span) {
  # data is x, and y
  # want to predict at xnew using a fitted line
  # if xnew is not given predictions are at the sorted x values
  # you have to specify the span (no default value)
  N <- length(xnew)
  Hold <- rep(NA, N)
  for (k in 1:N) {
    ind <- abs(x - xnew[k]) <= span
    # check if enough data is within the span of the xnew
    if ( sum(ind) > 2) {
      fit <- lm(y[ind] ~ x[ind])
      Hold[k] <- fit$coefficient[1] +  fit$coefficient[2] * xnew[k]
    }
    # otherwise Hold just gets a NA
  }
    results <- cbind(xnew, Hold)
    return(results)
}

