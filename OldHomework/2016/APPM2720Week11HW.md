###APPM2720 Homework for Week 11

This is a short assignment to get practice running the **glm** function and also evaluating the classifer using true positive rate and false positive rates. 

Refer to the [Week 11](http://www.image.ucar.edu/~nychka/Temp/APPM2720/Week11) folder and the R script LogisticRegression.R. 

1) For the spam data set **spam.RData** fit a logisitic regression model 
to the training subset ( **subset=train**) using the variable **free** and give a 95% confidence interval for the
free coefficient. 

2) From your fit in 1) for a cutoff of  .5 find the true positive rate and the false positive rate using the data NOT in the training sample 

3) Repeat your analysis using both **log10(capLong)** ( i.e ````I(log10(capLong)````  and the **free** using a a pus sign in the glm formula. Find the true positive rate and the false positive rate change  for this new model as a classifier with a .5 cutoff. It this a better classifier?

