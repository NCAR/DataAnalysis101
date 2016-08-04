library(dataWorkshop)

# regression on subset of Audi A4 data

data( AudiA4)

Y<- AudiA4$price
X<- AudiA4$mileage

ind<- ( X >= 20000) & ( X <= 75000)
Ysub<- Y[ind]
X1<- AudiA4$mileage[ind]
N<- length( Ysub)

sd( Ysub)
fit1 <- lm( Ysub~ X1)
summary( fit)

RSS<- sum( fit$residuals^2)
RSE<-   sqrt( RSS/(N-2) )

X2<- AudiA4$year[ind]

fit2 <- lm( Ysub~ X2)
summary( fit2)

# scrambling up the Y's
ix<- sample( 1:N,replace=TRUE )


Yscrambled <- Ysub[ix]
fit3 <- lm( Yscrambled~ X2)
summary( fit3)











