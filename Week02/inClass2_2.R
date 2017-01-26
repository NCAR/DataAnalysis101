
# working with subscripts
X<- -10:5
X2<- seq( -10,5,by=1)
X(5) # does not work
X[5]
X[1:5]

c(2,5, 6)

X[c(2,5,6)]

# single subscripts, sequences, irregular, logical
X3<- c( 3,5.1, 6 , 59)
X3
ind<- c( TRUE, FALSE, TRUE,FALSE)



# load Boulder June temperatures  this is a 2X30 table (aka an array)
load("BT.rda")

BT<- BoulderJuneTemperature

# the dim command
dim(BT)
# first 10 values of temp
# subscripts
# first 10 rows.
BT[1:10, 1:2 ]

BT[1:10,  ]

# values greater than 70 degrees
ind<- ( BT[ ,2] > 70 )

BT[ ind, ]


#Q Plot the June temperatures by year highlight the 
# values over 70.
plot( BT$Year, BT$Temp)
plot(BT)

#points( BT[ ind, ], col="blue1", pch=16 )
points( BT[ ind, ], col="lightblue", pch=16 , cex=2)


# functions in R
# mean, effect of na.rm=TRUE
mean( BT[,2])
# 74 value set to missing
BT[29,2] <- NA


mean( BT[,2], na.rm=TRUE) # gives just an NA


# quantile function
# and interquartile range

# apply function
load("AudiA4.rda")
dim( AudiA4)
head( AudiA4)
mean( AudiA4[,2])
mean( AudiA4$price)

# means of first 4 columns of this data set
 apply(AudiA4[,1:4], MARGIN= 2, FUN = "mean" )
 
 apply(AudiA4[,1:4], MARGIN= 2, FUN = "median" )

 # use tapply to find means by year
 
#  boxplots of prices by year
 
# writing your own.
# function has three parts:
# 1 calling arguments, 
# 2 body with R code
# 3 return statement
 
 myFun<- function( x,y){
   product<- x*y
   return(product)
 }

 result<- myFun(4,5)
 
# a function to find the IQR
 myIQR<- function( x){
   Q1<- quantile(x, .25)
   Q3<- quantile( x, .75)
   IQR<- Q3 - Q1
   return( IQR)
 }
 
# adding na.rm argument, wipe out name
 
# which year has the biggest spread?
 
 
 
 







