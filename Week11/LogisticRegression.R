################################################################################################
## A simple spam classifier: logistic regression
################################################################################################

load("spam.RData")

ls()

names(dat)

table(train)

n <- dim(dat)[1]

## Take a look at some data
summary(dat[,1:5])
table(dat$spam)

## Length of longest uninterrupted string of capital letters
plot(spam~capLong,data=dat)
plot(spam~(capLong),data=dat, xlim=c(0,2500))
plot(spam~log(capLong),data=dat)
boxplot(log(capLong)~spam,data=dat)

## Frequency of the word "business"
plot(spam~business,data=dat)
boxplot(business~spam,data=dat)

# combined relationship between business and capLong
plot( sqrt(dat$business), log10(dat$capLong), col= dat$spam+1,
      log="y",
      pch=16)



## Set up testing data
spam.test <- dat[!train,]$spam

##
## Logistic regression on capLong
##

fit <- glm(spam~I(log10(capLong)), data=dat, 
           family=binomial,
           subset=train) # family = binomial => logistic
summary(fit)

## Check fitted values
yhat <- fit$fitted.values
y <- dat$spam[train]
boxplot(yhat~y)




## Deviance residuals
dev <- resid(fit)
plot(dev)
yhat<- predict( fit, type="response")
plot(log10(dat$capLong[train]), dev )


which.max(abs(dev))
dat[2015,] # or dat[train,][1893,]
dat[2015,c("spam","capLong")]


## Classification rule and evaluation for 
## data NOT in training part  ( !train)

## Predicted probabilities
fit.probs <- predict(fit,newdata=dat[!train,],type="response")
# Set the cutoff for classifying at .5 (this is a free parameter to choose)

fit.pred<- ifelse( fit.probs <= 0.5, 0, 1)

## "Confusion" matrix
look<- table(fit.pred,spam.test)
N<- length( fit.pred)

# proportion of correct predictions
sum(fit.pred == spam.test)/N
# or
(look[1,1] +look[2,2])/N

# True positive rate
look[2,2]/( look[1,2] +look[2,2])

# False positive rate
look[2,1]/( look[1,1] + look[2,1])


