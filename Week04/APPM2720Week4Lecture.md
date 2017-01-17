# APPM2720 Week4 Lecture

## More on programming

A ````for```` loop is often a useful way to loop over a data set or to do a compuation. 

To get started here is another way to modify more than one value

*Usual*

```{r} 
 x<- 1:10
 xSquared<- x^2
```
*With for loop*

```{r}
for( k in 1:10){
print( k, k^2)
}
```
*Saving data*

```{r}
x<- 1:10
xSquared<- rep( NA, 10) 
 
for( k in 1:10){
  xSquared[k] <- x[k]^2
}

```
*as a more generic function*

```{r}
makeSquaresTable<- function(N){
x<- 1:N
xSquared<- rep( NA, 10)
for( k in 1:10){
  xSquared[k] <- x[k]^2
}
myTable<- cbind( x, xSquared)
return(myTable)
}

```

An important command to use within a for loop is the 
````if```` statement to control computations based on 
conditional statements. 

For example for the ````AudiA4```` data set one might only want to calculate statistics by year if the number of samples is large enough. 

```{r}
yearsInData<- unique( AudiA4$year)
for( yr in yearsInData){
  ind<- AudiA4$year == yr
  tempP <- AudiA4$price[ind]
  tempM<- AudiA4$mileage[ind]
  print( sum(ind))
  ### if block
  if( sum( ind) > 10){
    #  do some stats on tempP and tempM
    print( mean( tempP/ tempM) )
  }
}
```
An extension is the if/else statement that allows you to deal with both cases (TRUE or FALSE). Here is an example for changing the if block above

````
### if block
  if( sum( ind) > 10){
    #  do some stats on tempP and tempM
    print( mean( tempP/ tempM) )
  }
  else{
    print("less than 10 observations"}
  }
````


 

