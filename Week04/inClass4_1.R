## ----Section1 ----

#############################
#looping in R the for loop 
######################################

library( dataWorkshop)
data(AudiA4)

# here we will loop over years and fit a line that describes how 
# price depends on mileage.

# example of lm function 
x<- 1:10
y<- 5 + 2*x

lm( y~x)

set.seed( 122)
error<- rnorm( 10)*.2
y<- 5 + 2*x + error
lm( y ~ x)

# try this out on the A4 data

fit0<- lm( AudiA4$price ~ AudiA4$mileage )

plot(AudiA4$mileage,AudiA4$price )
abline( fit0$coefficients, col="orange2", lwd=3)

# fit each year separately 
# I only know how to do this with a for loop

for ( k in 1:17){
 
}

# plotting all these
plot(AudiA4$mileage,AudiA4$price, pch=16, col="grey" )
for( k in 1:17){
  
}

# cutting into bigger groups. 

groups<- cut( AudiA4$year, 4)
groupID<- as.numeric( groups)



# another example of looping
# drawing a mathematical surface

x<- 
y<- 
Z<- matrix( NA, 40, 40)

# double for loops

# for perspective need to adjust arguments so that it is 
# easier to interpret
par( mar=c(0,0,0,0) )
persp( x,y, Z, phi=20, theta=45, shade=.3, col="grey80",
       border="grey")












