load("spam.RData")
source("ROC.point.R")

fitAll<- glm( spam ~ . , subset=train,
              family =binomial, data=dat)
test.data<- dat[!train, "spam"]
test.prob<- predict( fitAll, type="response",
                     newdata=dat[!train,])
cutPs<- seq( 0, 1,.01)
results<- ROC.point(cutPs, test.prob, test.data )

plot( c(0,1), c(0,1), type="l" , xlab="FPR", ylab="TPR")
lines( results, lwd=2, col="brown")

bag<- function(train0){
  fitAll<- glm( spam ~ . , subset=train0,
                family =binomial, data=dat)
  test.data<- dat[!train0, "spam"]
  test.prob<- predict( fitAll, type="response",
                       newdata=dat[!train0,])
  cutPs<- seq( 0, 1,.01)
  results<- ROC.point(cutPs, test.prob, test.data )
  return(results)
}

# sampling
 trainEXP<-   c( rep( FALSE,1000), rep(TRUE, 3601 ))
 u<- runif( 4601)
 look<- trainEXP[order( u)]
 
 
# bagging results
 trainEXP<-   c( rep( FALSE,1000), rep(TRUE, 3601 ))
 plot( c(0,1), c(0,1), type="l" , xlab="FPR", ylab="TPR")
 results<- bag( train)
 lines( results, lwd=2, col="brown")
 
 trainTemp<- trainEXP[ order( 
                             runif( 4601) 
                             )
                       ]
 for( k in 1:20){
   trainTemp<- trainEXP[ order( 
     runif( 4601) 
   )
   ]   
 results2<- bag( trainTemp )
 lines(results2, col=k)
 }
 
 
 VN<- names(dat)
 VN<- as.character(VN)
 
 A<- "capLong"
 B<- "business"
 
 AB<- paste( c(A, B), collapse=" + ")
 
 for1<- paste( "spam ~ ", AB)
 for1<- as.formula( for1)
 
 fit0<- glm( for1, subset=train, data=dat, family=binomial)
 
 
 look<- summary( fitAll)
 ind<-  abs( look$coefficients[,3]  ) > 2
 
 ind<- ind[2:58]
 
 # what are the good variables
 VN[ind]
 
 allGood<- paste( VN[ind], collapse=" + ")
 
 forGood<- as.formula( 
                     paste("spam ~", allGood)
                      )
 fitLast<- glm( forGood, data= dat,subset=train, 
                family=binomial)
 
 fitlast.prob<- predict( fitLast, newdata=dat[!train,],
                         type="response")
 
 resultsLast<- ROC.point( cutPs, fitlast.prob, test.data )
 
 lines(resultsLast, col="magenta", lwd=2 )
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 





