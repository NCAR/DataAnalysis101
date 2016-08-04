
load("spam.RData")

fit <- glm(spam~I(log10(capLong)), data=dat, 
           family=binomial,
           subset=train) # family = binomial => logistic
## Set up testing data
spam.test <- dat[!train,]$spam
## Predicted probabilities
fit.probs <- predict(fit,newdata=dat[!train,],type="response")

##
## ROC curve for first fit
##


source( "ROC.point.R")

## Function that will give ROC coordinates (FPR,TPR) for a given classification cutoff p


ROC.point(0.5, fit.probs, spam.test)

fitHW<-  glm(spam~I(log10(capLong)) + free, data=dat, 
                        family=binomial,
                        subset=train)
fit.probsHW <- predict(fitHW,newdata=dat[!train,],type="response")
ROC.point(0.5, fit.probsHW, spam.test)



## ROC curve for   log10 capLong
pSeq<- seq( 0, 1, by=.01)
results<- ROC.point( pSeq, fit.probs, spam.test)

plot(c(0,1),c(0,1),xlim=c(0,1),ylim=c(0,1), type="l",
     xlab="FPR", ylab="TPR")
lines( results, lwd=2)

# maybe a classification threshold of 40% reasonable?
abline(h= ROC.point(.4, fit.probs, spam.test )[2], col="green")



results2<- ROC.point( pSeq, fit.probsHW, spam.test)
lines( results2, col="red4", lwd=2)
