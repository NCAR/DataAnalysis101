## Function that will give ROC coordinates (FPR,TPR) for a given classification cutoff p
ROC.point <- function(cutOff, fit, test ){
  N<- length( cutOff)
  M1<- sum( test==1 ) 
  M2<- sum( test ==0)
  out<- matrix( NA, ncol=2, nrow=N)
  dimnames( out)<- list( NULL, c("FPR", "TPR"))
  for( k in 1:N){
# classifier using fit > cutOff is  a "1"    
    ind<- as.numeric( fit > cutOff[k])
      TPR <- sum( ind==1 & test ==1)/M1 
      FPR <- sum( ind==1 & test ==0)/M2 
      out[k, ] <- c( FPR, TPR)
    }
  return(out)
}
