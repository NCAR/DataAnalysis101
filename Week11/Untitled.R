load("spam.RData")
source( "ROC.point.R")
N<- nrow( dat)
set.seed( 123)

bagAll<- function(){
ind<-sample( 1:N, 800, replace= FALSE) 
trainNEW<- rep( TRUE, N)
trainNEW[ ind] <- FALSE
datMatrix<- ( dat)
xNames<- paste("x",1:57,sep="")
names(  datMatrix)<- c("spam",xNames )

allFormula<- as.formula(
  paste( "spam ~ ", paste(xNames, collapse=" + ") )
         )

fit <- glm( allFormula, data=datMatrix,
           family="binomial",subset= trainNEW)
           # family = binomial => logistic

## Predicted probabilities
fit.probs <- predict(fit, newdata=datMatrix[!trainNEW,],
                     type="response")

## ROC curve for   log10 capLong
pSeq<- seq( 0, 1, by=.01)
results<- ROC.point( pSeq, fit.probs, (datMatrix$spam)[!trainNEW] )
return( results)

}

plot(c(0,1),c(0,1),xlim=c(0,1),ylim=c(0,1), type="l",
     xlab="FPR", ylab="TPR")
for( k in 1:50){
  results<- bagAll()
lines( results, lwd=.5, col="red")
points( results[50,1], results[50,2],pch=16, cex=.5)
}




