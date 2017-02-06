# APPM2720 Week4 Lecture

## reveiw of functions:

A simple interquartile function:
```
 myIQR<- function( y, na.rm=FALSE)
 {
 # function body
  hold<- quantile( y, c( .75,.25),
                       na.rm = na.rm )
                 )
 # return         
  return( hold[2]-hold[1])
 }
```

## looping and flow control 

A ````for```` loop is often a useful way to loop over a data set or to do a compuation. 

To get started here is another way to modify more than one value

*Usual*

```{r} 
 x<- 1:10
 xSquared<- x^2
 cbind( x, xSquared)
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

Looping over data subsets 
Find the mean for the AudiA$ prices by year
```
```{r}
for( yr in 1999:2015){
  ind<- AudiA4$year == yr
  tempM<- mean( AudiA4$price[ind] )
  print( c(yr, tempM) )
}
```

An important command to use within a for loop is the 
````if```` statement to control computations based on 
conditional statements. 

For example for the ````AudiA4```` data set one might only want to calculate statistics by year if the number of samples is large enough. 


```{r}
for( yr in 1999:2015){
  ind<- AudiA4$year == yr
  tempM<- mean( AudiA4$price[ind] )
  if( sum( ind) >=20 ){
  print( c(yr, tempM) )
  }
}
```

An extension is the if/else statement that allows you to deal with both cases (TRUE or FALSE). Here is an example for changing the if block above

```
for( yr in 1999:2015){
  ind<- AudiA4$year == yr
  tempM<- mean( AudiA4$price[ind] )
### ifelse block
  if( sum( ind) > 20 ){
    cat( yr, tempM, fill=TRUE) 
  }
  else{
    cat( yr, " has less than 20 observations",
                    fill=TRUE)
  }
### end ifelse block  
}  
```
```cat``` is a handy way to print out things in
a loop. It is very flexible but be sure to add
``` fill = TRUE``` to start the next printing
on a new line. 




 

