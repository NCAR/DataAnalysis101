library( fields)

load("BBoulder")

BBoulder1<- na.omit( BBoulder)

FitD<- lm( PLACE~ MILE1 + I( MILE1^2)+ MILE6 + I( MILE6^2), BBoulder1)

 hold<- abs(FitD$residuals)
 ind<- order( hold, decreasing=TRUE)[1:4]

M<- nrow( BBoulder1)
temp<- matrix( NA, ncol=7, nrow= M)
for( k in 1:M){
  temp[k,1:6]<- cumsum( c(BBoulder1[k,6:11]) )
  temp[k,7]<- BBoulder1[k,13]
  temp[k,]<- temp[k,] 
}
 temp[,7]<- BBoulder1[,13]
 temp2<- temp- matrix( c(1:6, 6.2), nrow=M, ncol=7)*BBoulder1[,12]
 
 race <- t( temp)
 race2 <- t( temp2)
 
 matplot( c( 1:6, 6.2), race, type="l", col="blue")
 race0<- race - matrix( race[,1], ncol=182, nrow=7)
 
 matplot( c( 1:6, 6.2), race0, type="l", col="blue", lty=1)
  matlines( c( 1:6, 6.2),race0[,ind], col="red" , lwd=3)
 
   matplot( c( 1:6, 6.2), race2, type="l", col="blue", lty=1)
  matlines( c( 1:6, 6.2),race2[,ind], col="red" , lwd=3)
  
 
 
 
 
 
