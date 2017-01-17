###APPM2720 Homework 9

Please hand in this homework by midnight Monday March 7, 2016

This  homework  explores adding more than one
predictor variable. This can be done either by adding 
polynomial terms beyond just a straight line fit
(e.g. fitting a quadratic function) or 
looking at different variables. 

By the end of this assignment you will have the knowledge and skills to attempt data analysis using multivariate regression --
congratulations!

In the **dataWorkshop** package the dataset **WorldbankCO2**
has CO2 emissions per capita and by country for 1999. Goal is to 
explain (i.e. be able to predict) CO2 emissions based on other 
demographic variables. 


1) To consider the relationship between CO2 emissions, CO2.cap and 
GDP.cap ( This is Gross Domestic Product or average income per person) make a panel of 4 scatter plots ( e.g. **set.panel( 2,2)**) 
that go through  the different combinations of log and unlogged variables. You can use the **log10** function so that the logged variable is in base 10 and so easier to interpret. Which of these cases is the most suitable for fitting a linear model?

Set
````
Y<- log10(WorldbankCO2$CO2.cap)
X1<- log10(WorldbankCO2$GDP.cap)
````

2) Use **lm** to predict **Y** based on **X1**.  What is the $R^2$ for your fit? Plot the residuals against **X1** and comment on any patterns. 


3) Fit a quadratic component to your model from 2): 
 (  add **I(X1^2)** in the lm formula or just create a new variable
  say  **X2<- X1^2**). See if this changes the 
 residual plot from 2 and comment on how the $R^2$ changes
 
 4) Now consider whether **Pop.mid** or  **Pop.urb** improve your 
 model from 3) you can base this decision on how much the model
 $R^2$ increases or if the residual plots improve. 

 5) For your best model use the **identify** function to identify 
 any outliers (e.g. particular countries) that are not fit well by your model. 
  


