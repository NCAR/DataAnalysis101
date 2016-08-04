## Function that will give ROC coordinates (FPR,TPR) for a given classification cutoff p
ROC.pointOLD <- function(cutOff, fit, test ){
  N<- length( cutOff)
  out<- matrix( NA, ncol=2, nrow=N)
  dimnames( out)<- list( NULL, c("FPR", "TPR"))
  for( k in 1:N){
    look<- table(  (fit > cutOff[k])  , test)
    # catch any cases with zero counts
    # and return NAs
    if( all( dim(look)==2 ) ){
      TPR <- look[2,2]/( look[1,2] + look[2,2])
      FPR <- look[2,1]/( look[1,1] + look[2,1])
      out[k, ] <- c( FPR, TPR)
    }
  }
  return(out)
}
