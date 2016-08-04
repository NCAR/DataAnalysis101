library(dataWorkshop)

# do splines really work?
set.seed( 123)
x<- runif(200)
x<- sort( x)
# true function ( Thanks to Robert Dubas!)
Num<- (-9/2)*x^(5/8) + 
           (18/256)* x^(4) 
Den<- exp(cos( 14*x))

true<- Num/Den
true<- true/sd(true)

set.seed( 233)
y<- true + .5*rnorm( 200)

plot( x,y)
lines( x, true, col="red")

fit<- sreg( x, y)
names( fit)
lines( fit$predicted, col="magenta")


plot(c(0,1),c( -7,2), type="n")

set.seed( 244)
for( k in 1:50){
  y<- true + 2*rnorm( 200)
  fit<- sreg( x, y)
  lines( fit$predicted, col="magenta")
}

lines( x, true, col="brown", lwd=3)


data( VictoriaT)
quartz()
set.panel( 3,3)
for( k  in 1:9){
  image.plot( VictoriaT$x,VictoriaT$y,
                 VictoriaT$z[,,k] )
  
}

for( k  in 1:203){
  print(k)
  print( sum( 
             !is.na(
               VictoriaT$z[,,k]
               )
             )
        )
}


# hmmm something strange about k=8

stats( c( VictoriaT$z[,,8]))








  

