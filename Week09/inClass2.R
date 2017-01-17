library( dataWorkshop)

Bolder<-  read.table( "BB200.txt", header=TRUE, skip=2)

convertTime<- function(tt){
  tt <- as.character(tt)
  m<- nchar( tt)
  mn<- substr(tt,1, m-3)
  sec<- substr(tt,m-1,m)
  mn<- as.numeric( mn)
  sec<- as.numeric( sec)
  return( mn + sec/60)
  
}

BolderN<- na.omit(Bolder)
BolderN<- Bolder


for(  k in (6:13) ){
  BolderN[,k]<- convertTime(BolderN[,k])
}

fitA<- lm(PLACE ~ MILE1 , data=BolderN)

fitB <- lm( PLACE ~ MILE1 + MILE6,  data=BolderN)

plot(fitB)

set.panel(1,2)
plot(BolderN$MILE1, fitB$residuals)
plot(BolderN$MILE6, fitB$residuals)

fitC <- lm( PLACE ~ MILE1 + MILE6 + I(MILE6^2),  data=BolderN)
set.panel(1,2)
plot(BolderN$MILE1, fitC$residuals)
plot(BolderN$MILE6, fitC$residuals)


fitD <- lm( PLACE ~ MILE1 +  I(MILE1^2) + MILE6 + I(MILE6^2),  data=BolderN)

set.panel(1,2)
plot(BolderN$MILE1, fitD$residuals)
abline(h=0, col="red")
plot(BolderN$MILE6, fitD$residuals)
abline(h=0, col="red")

summary( fitD)

plot( fitD$fitted.values, fitD$residuals )
ind<- identify( fitD$fitted.values, fitD$residuals)

quilt.plot(cbind( BolderN$MILE1, BolderN$MILE6), BolderN$PLACE )
X<- cbind( BolderN$MILE1, BolderN$MILE6)

points(X[ind,], col="magenta" )

library(rgl)
open3d()
plot3d( BolderN$MILE1, BolderN$MILE6, BolderN$PLACE)
plot3d( BolderN$MILE1, BolderN$MILE6, fitD$fitted.values)

# nuclear option fitting a nonparametric surface

library( fields)
X<- cbind( BolderN$MILE1, BolderN$MILE6)

out<- Tps( X, BolderN$PLACE)
plot3d( BolderN$MILE1, BolderN$MILE6, out$fitted.values)
surface( out)

plot( out$residuals, fitD$residuals )














