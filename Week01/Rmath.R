## ---- Section1 ----

#  doing some arithmetic 
 A<-  2
 B<-  10
 Y<- A + B
#
 A<- c( 2,3,4)
 B<- c( 10,100,1000)
 Y<- A + B
# note that the numbers have been added row by row like a spread sheet.

# Some other operations:
 
2^4

2*(1+4)
#Q how is this different than   2* 1+4 ?

# more complicated operations are functions
sqrt( 81)
exp( 2)
#Q guess at inverse function to exp and check it

# generating a sequence 
1:10

-5:5

#Q How wouldyou generate the values in roder  5 to 1?

# generating sin wave
 x<- 1:100
# hundred values between 0 and 2*pi
 x<-  2* pi * (x/100)
 y<- sin( x)
 
 plot( x,y)
 # Q generate a cosine curve  what happens to the 
 # Q function sin(x)*cos(x) ?
 
 #Q how would you change the plot to connect points with a line
 # instead of points
 
 # another way of creating the x
 
 x<- seq( 0, 2*pi, length.out=100)

# arithemtic and random values 
# generating  10 random numbers between 0 and 1 
 
U <- runif( 10)
mean(U)

#Q  is the mean of the square of the data equal to the 
# square of the mean? 

#Q how about the median? 

#Q Are the mean and median the same for [0,1] random numbers?

# Q What happens to the mean of a data set  X if you transform it
#  say  b*X + a ?

#Q what happens to the max as the sample size increases






U

 
 
 
 



















