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

convertTime2<- function(tt){
  tt <- as.character(tt)
  m<- nchar( tt)
  mn<- substr(tt,1, m-3)
  sec<- substr(tt,m-1,m)
  mn<- as.numeric( mn)
  sec<- as.numeric( sec)
  return( mn*60 + sec)
  
}

BolderN<- Bolder
for(k in 6:13 ){
  BolderN[,k]<- convertTime(Bolder[,k] )
}

library( BolderN)
stats( BolderN)
BolderN<- na.omit( BolderN)

BolderN[1,  ]

sex<- as.factor( substr( BolderN$DIV, 1,1))

fit0 <- lm( PLACE ~ MILE1, BolderN)

fit1 <- lm( PLACE ~ sex, BolderN)

fit2 <- lm( PLACE ~MILE1 + sex, BolderN)








