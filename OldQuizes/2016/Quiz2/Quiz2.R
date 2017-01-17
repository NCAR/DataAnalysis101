results<- read.table("BB200.txt", header=TRUE, skip=2 )

convertTime<- function(tt){
  tt <- as.character(tt)
  m<- nchar( tt)
  mn<- substr(tt,1, m-3)
  sec<- substr(tt,m-1,m)
  mn<- as.numeric( mn)
  sec<- as.numeric( sec)
  return( mn + sec/60)
 
}