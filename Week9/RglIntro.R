library( rgl)

library( dataWorkshop)

# need to point session to Week 9

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


BolderN<- Bolder
for(k in 6:13 ){
  BolderN[,k]<- convertTime(Bolder[,k] )
}



fitD<- lm( PLACE ~ MILE1 + I(MILE1^2) + MILE6 + I(MILE6^2) , data=BolderN)
plot( fitD$fitted.values, fitD$residuals)
ind<- identify( fitD$fitted.values, fitD$residuals)


open3d()
N<- nrow( BolderN)
colTable<- rainbow(N)
colTable[ind]<- "black"

plot3d(BolderN$MILE1, BolderN$MILE2, BolderN$MILE6, 
       col= colTable, cex=1.5)

plot3d(BolderN$MILE1, BolderN$MILE2, BolderN$MILE3, 
       col= rainbow(N))

out<- Tps( cbind( BolderN$MILE1, BolderN$MILE2), BolderN$PLACE)



