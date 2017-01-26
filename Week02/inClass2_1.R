### Lecture 2  APPM2720

# ls
ls()
# <-
# assignment aka = 
a <- 4.5
a # prints this out

ls # prints complicated ls program

# so use! ls()

# c
b<- c( 2,4)
 ls()
 X<- b + c( 3,4)
 
# rm 
 rm( X)
 ls()
 X2<- 1:5
 X3<- c( pi, 2*pi,6,7,8)
#Q how would you combine X2 and X3 to make a new data set ?
Z<- X2 + X3
Z

#Q What are the differences between  test <- X3 and  "test" <- X3 
#       and test <- "X3" ?

#Q How would you create the data set with the name Donald Trump ?

"Donald Trump" <- X3

#Q How would you save this R script with your modifications?
# use pull down menu


##  doing some arithmetic 
# vector operations 
# ^, sqrt, log, exp
# Q find the square root of 2 using logs and exponents
sqrt(2)

hold<-  log( 2)

hold2<- exp(10)

exp( log( 2)/ 2)


# seq( a,b, by, length.out)
help( seq)
# generate sequence of 100 points from  0 to 4pi
seq(0, 100,by = 4*pi) # not the right sequence

x<- seq(0,  4*pi, length.out = 100)

plot( x, sin(x))
plot( x, sin(x), type="l")

# sin curve

# Q what happens to the curve sin(x) * cos(x) ?
plot( x, sin(x)*cos(x), type="l")


# load Boulder June temperatures  this is a 2X30 table (aka an array)
load("BT.rda")
# first 10 values of temp
# subscripts
# first 10 rows.
# values greater than 70 degrees

#Q Plot the June temperatures by year


