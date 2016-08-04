#APPM2720 Lecture 11.2

  ###Logisitic regression in R and evaluating the fit. 
  
  The **glm** function follows the same formula style as **lm** with just a few added arguments to indicate that one has 0,1 data and a logistic transformation. 
  
 For the spam data and using **capLong** the call is 
 
```fit <-  glm(spam~capLong, data=dat,family=binomial)```

Similar to **lm** one can use the **summary** function to get information about the fit and **predict** to make predictions. There is also  a concept 
of a residual but it is not as easy to use as the ones from **lm**.
Note that the predicted values can have two forms: they can  be the probabilities implied by the 
logisitic function and the linear model (**response** option in type) or just the linear part predicted by the covariates without (**link** option). 

### What to do with the probabilities?
In some applications such those from medicine or public health the estimated probabilities are important. E.g. what is the probability of 
a drug being effective. However, for the spam case and in for classication problems the probability is an intermediate step to build the classifer:

1) Choose a threshhold  *B*

2) If the predicted probability is greater than *B* then classify as a "1"
(spam email in the spam example). If  predicted probability is less than *B* classify as a "0" or good email. 

Note that we have the choice of *B* being any value in the range from 
0 to 1. 

### Evaluating the classifier
It is standard to fit the glm to part of your data set and then test out the classifier on the remaining part. This help to avoid overfitting and
biasing the results by using the data twice. 

It is helpful to see how this would be done in R.
For the spam data set train is a logical to separate the full dataset into 
training and testing. Also it may be better to use log10 capLong instead of 
its raw values.

```
fitGLM <-  glm(spam~I(log10(capLong)), data=dat,family=binomial, subset=train)

fit.test<- predict( fitGLM, newdata=dat[ !train,], type="response")
data.test<- (dat[!train,])$spam
#use .5 as the B value
class.test<-  ifelse( fit.test < .5, 0,1)

confusionTable<- table(  class.test, data.test)
```
The *confusion* table shows how well we are doing both in terms of classifying correctly and the misclassifications.
````
 confusionTable
           data.test
class.test   0   1
         0 119  42
         1  14  71
````

We focus on two features that can be extracted from this table

True positive rate (TPR)  The fraction of spam emails that are classified correctly. ( 71 / ( 42 + 71) = 62.8% ).

False positive rate (FPR) The fraction of good emails that are classified as spam  ( 14/ ( 119 + 14) = 10.5% )

The function *ROC.point* is some handy code that computes these two frequencies for a set of B values. It can also be used to draw a ROC curve. 















