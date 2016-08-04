load("spam.RData")
fit0<- glm( spam ~ log10( capLong) ,
           data=dat, family=binomial, subset=train)

test.probs0<- predict( fit0, newdata=dat[!train, ],
                      type="response")

fit<- glm( spam ~ log10( capLong) + free ,
           data=dat, family=binomial, subset=train)


fitAll<- glm( spam ~ . ,
           data=dat, family=binomial, subset=train)
# sll variables
test.probsAll<- predict( fitAll, newdata=dat[!train, ],
                         type="response")

test.probs<- predict( fit, newdata=dat[!train, ],
                     type="response")
test.spam<- dat[!train,"spam"]

plot( test.probs, test.spam)

boxplot(test.probs ~ test.spam )

test.class<-  as.numeric(test.probs > .5)

table( test.spam, test.class)
# compare 
ROC.point( .5, test.probs, test.spam)

seq.prob<- seq( 0,1,.01)

plot( c(0,1), c(0,1), xlab="FPR", ylab="TPR")
results<- ROC.point( seq.prob,
                    test.probs, test.spam )
lines( results, col="red")
abline( 0,1, col="grey", lty=2, lwd=2)
results0<- ROC.point( seq.prob,
                      test.probs0, test.spam )
lines( results0, col="purple")
resultsAll<- ROC.point( seq.prob,
                      test.probsAll, test.spam )
lines(resultsAll , col="brown", lwd=2)




