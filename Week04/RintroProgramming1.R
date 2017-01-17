## ----Section1 ----

#############################
#looping in R the for loop 
######################################

# simple loop
  for( k in 1:10){
    print( c(k, k^2) ) }

######################################
#### creating a new object through a for loop
######################################
myTable<- matrix( NA, ncol=2, nrow=10)
for( k in 1:10){
  myTable[k, 1:2] <- c(k, k^2)
  }

########## looping over rows of a data set
##########
load( "BoulderTemperature.rda")
# find the number of rows and columns
dim( BoulderTemperature)
myStats<- matrix( NA, nrow=118, ncol=3)

# for some reason this example will work for a data frame
# I think it has to do with data frame allowing for rows that 
# may be of the same type.

# convert this to a matrix format instead.

BTMatrix<- as.matrix( BoulderTemperature)
# find the mean and median for each year
for( k in 1:118){
  print(k)
  TempYear<- c(BTMatrix[k,1:12])
  print(TempYear)
  tStats<- c( mean(TempYear), median(TempYear), sd(TempYear) ) 
  print(tStats)
  myStats[k,1:3] <- tStats
  }
# recall to get the Years
Year<- as.numeric( row.names( BoulderTemperature))
plot( Year, myStats[,1], xlab="year", ylab="Degrees F")
points( Year, myStats[,2], col="red")

##################################################################
# Q create a plot to investigate the years when the mean and median differ.
##################################################################

# HINT  start by writing a for loop over years that plots months connected by lines ???
# Here is code to draw all the years. But also note this plot is not very helpful by itself.


plot( 1:12, BTMatrix[1,], type="l", ylim=c(20,80))
for( k in 2:118){
    tempData<- BTMatrix[k,]
# only add a line if mean (and thus median) are NOT NA    
    if( !is.na( mean( tempData) ) ) {
      lines( 1:12, tempData , col="blue")
    }       
}

# loop only plotting seasons with big differences (greater )

plot( 1:12, BTMatrix[1,], type="n", ylim=c(-20,40))
# type "n" just sets up axes and does no plotting.

for( k in 1:118){
  tempData<- BTMatrix[k,]
  # only add a line if mean (and thus median) are NOT NA    
  if( !is.na( mean( tempData) ) ) {
    if( abs(mean( tempData)- median(tempData)) >0 ){
    lines( 1:12, tempData -median(tempData), col="blue")
  } 
  }
}
  
   abline( h=0, col="grey")
    


   for( k in 1:118){
     tempData<- BTMatrix[k,]
     # only add a line if mean (and thus median) are NOT NA    
     if( !is.na( mean( tempData) ) ) {
       if( abs(mean( tempData)- median(tempData)) > 3){
         lines( 1:12, tempData -median(tempData), col="red")
       } 
     }
   }
