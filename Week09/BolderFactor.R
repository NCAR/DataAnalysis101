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

for(  k in (6:13) ){
  BolderN[,k]<- convertTime(BolderN[,k])
}



# converting to M/Female and age

BolderN$sex <-  as.factor(substr(BolderN$DIV,1,1))
BolderN$age <-  as.numeric( substr(BolderN$DIV,2,3) )




fit0<- lm( PLACE ~  MILE1,  data=BolderN )

fit1<- lm( PLACE ~ sex ,  data=BolderN )

fit2<- lm( PLACE ~  MILE1 + sex ,  data=BolderN )

lev<- c("steady", "fast")
ind<- (BolderN$MILE6 > BolderN$MILE1 )+ 1

KICK<- as.factor( lev[ind]  )

plot( BolderN$MILE6, fit2$residuals, pch=16 , col=KICK) 
  

fit3<-  lm( PLACE ~  MILE1 +  KICK + sex ,  data=BolderN ) 

fit4<-  lm( PLACE ~  MILE1 +  MILE6 + sex ,  data=BolderN )
plot( BolderN$MILE6, fit4$residuals, pch=16 , col=KICK)

fit5<-  lm( PLACE ~  MILE1 +  MILE6 + KICK ,  data=BolderN )
plot( BolderN$MILE6, fit5$residuals, pch=16 , col=KICK)

# using sreg to tease out a smooth curve in residuals
outSreg<- sreg(BolderN$MILE6, fit5$residuals )
plot( outSreg$x,outSreg$y )
lines( outSreg$predicted, lwd=2, col='red4')


fit6<-  lm( PLACE ~  MILE1 +  MILE6 + I(MILE6^2)  ,  data=BolderN )
plot( BolderN$MILE6, fit6$residuals, pch=16 , col=KICK)

# trying to figure out what causes outliers

ind<- identify(BolderN$MILE6, fit6$residuals)

BolderN[ind,]
matplot( 1:6, t(BolderN[,6:11] ), type="l", col=1 )
matlines( 1:6,t(BolderN[ind,6:11] ), col="red", lwd=3)

quilt.plot( cbind(BolderN$MILE1, BolderN$MILE6), BolderN$PLACE)
points(cbind(BolderN$MILE1, BolderN$MILE6)[ind,], pch=16, col="magenta" )

quilt.plot( cbind(BolderN$MILE1, BolderN$MILE6),fit6$residuals)
points(cbind(BolderN$MILE1, BolderN$MILE6)[ind,], pch=16, col="magenta" )

# The nuclear option for fitting

out<- Tps( cbind(BolderN$MILE1, BolderN$MILE6), BolderN$PLACE )

quilt.plot( cbind(BolderN$MILE1, BolderN$MILE6),out$residuals)
points(cbind(BolderN$MILE1, BolderN$MILE6)[ind,], pch=16, col="magenta" )







