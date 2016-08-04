##APPM2720 Lecture 9A Categorical variables and regression

Besides using continuous variables to make predictions it is 
also useful sometimes to use variables that are just different catgories. e.g. Male/Female, Engine Type. 

This lecture goes over how the use of the class factor for variables makes it possible to include these in an lm equation. 

###Variables are factors
For the **AudiA4** data set has the variable **engine** to indicate the type of engine. This appears as character strings
(of the engine type) but it is actually a factor variable.

```` 
> is.numeric( AudiA4$engine)
[1] FALSE
> is.character( AudiA4$engine)
[1] FALSE
> is.factor( AudiA4$engine)
[1] TRUE
````

Factor variables simply keep track of different categories and have two parts: the character string names of the catogories,
known as **levels**,
and then an integer variable that maps each data value to one of the categories. The example below creates a simple factor
variable from character strings and then disects. Keep in mind that although the factor class may seem redundant it is makes it easy to include these kind of variables in a regression. 

````
#some character data
> var1<- c( "red", "blue", "red", "green", "blue", "blue", NA)
> print(var1)
[1] "red"   "blue"  "red"   "green" "blue"  "blue"  NA     
> 
> var1F<- as.factor(var1)
> print( var1F)
[1] red   blue  red   green blue  blue  <NA> 
Levels: blue green red
> 
> index1<- as.numeric( var1F)
> print(index)
[1]  3  1  3  2  1  1 NA

````

In either case ( **var1** or **var1F**) we should get the same 
result for **table**

````
> table( var1)
var1
 blue green   red 
    3     1     2 
````

### Creating the factor information "by hand"

This is good example of the use of the **match** function.

````
> levels<- unique( var1)
> print( levels)
[1] "red"   "blue"  "green" NA     
> index2<- match( var1, levels)
> print( index2)
[1] 1 2 1 3 2 2 4
> 
````
Note that **index1** and **index2** are not quite the same.
To get them equal one needs to omit **NA** as a possible item to match. Then case 4 will just be "matched" as an **NA**. 


### Factor surgery -- fixing the engine facotr in the Audi data
For the Audi data a simple example to see if the engine type makes a difference. Based on a table of these values there are 
problems with the categories and it makes sense to fix these first. 

````
table( AudiA4$engine)
  1.8T     2.0T      3.0    NEWLY Prestige       SE 
    51      305        1        2        2        1
# Oops! Some of these are not engines and can not
# handle just one dat point for 3.0
engineNew0<-  as.character(AudiA4$engine)
ind<- as.numeric(AudiA4$engine) 
engineNew0[ ind >= 3] <- NA
engineNew <- as.factor( engineNew0) 
table(engineNew)
```` 

###Including a factor in the ***lm*** function 
With the cleaned up version of the engine variable:

````
lm( price ~ engineNew, data=AudiA4 )

Call:
lm(formula = price ~ engineNew, data = AudiA4)

Coefficients:
  (Intercept)  engineNew2.0T  
         7339          15403  

````
Interpretation is that for cars without the 2.0  (the 1.8T) engine the
predicted value is 7339 for cars with the 2.0T the prediction is  (7339 + 15403) = 22742

Note that compared to the using other predictors this is 
not a very good model ( R^2 = .33)

Or including a more complete model 

````
lm( price ~ year + mileage + engineNew, data=AudiA4 )
````

### Creating a factor from a continuous variable

Here is a way to adjust for whether a car is within 250 miles of Boulder.

````
distF<- as.factor( ( AudiA4$distance <= 250) )
#recall that logicals get coded as 0 and 1.
lm( price ~ year + mileage + distF, data=AudiA4 )

Call:
lm(formula = price ~ year + mileage + distF, data = AudiA4)

Coefficients:
(Intercept)         year      mileage    distFTRUE  
 -3.033e+06    1.522e+03   -9.266e-02    3.865e+02  
````

The interpretation here is that there is a premium of about 
3865 dollars for cars within 250 miles.

### Centering the regression to make it interpretable.

The intercept is hard to interpret in many cases because the variables
are never extrapolated to zero ( e.g. price when year =0). 

It is convenient to  "center" the variables by their mean or subtract off a constant to make the
intercept interpretable.  Note that this adjustment *does not* change the 
actual fit or any statistics of the model, just the coefficients. 

````
lm( price ~ I(year - 1999)  + mileage + distF, data=AudiA4 )

Coefficients:
   (Intercept)  I(year - 1999)         mileage       distFTRUE  
     1.023e+04       1.522e+03      -9.266e-02       3.865e+02             
````

This way the base price (1999 year cars) is the intercept. 












