look<- read.csv( "work1.csv", header=TRUE, stringsAsFactors=FALSE)
look<- look[-1,]

look2<- read.csv( "work2.csv", header=TRUE, stringsAsFactors=FALSE)
lab<- look[,1]
N<- nchar( lab)
lab1<- substring(lab, 1, N-10)


dat<-  look2[,"Date"]
time<- as.Date( dat, format="%m/%d/%y")

Prices<- look2[,-1]
names( Prices) <- lab1
row.names( Prices) <- time

ind<- colSums( is.na(Prices) ) ==0
SP500Prices<- Prices[, ind]
#SP500Prices<- as.matrix( Prices)
#dimnames(SP500Prices)[[1]]<- time
SP500PercentChange<-  100*(SP500Prices[2:835, ] -  SP500Prices[1:834, ])/ SP500Prices[1:834, ]

SP500Names<- look[ind,1:2]
N<- nchar(SP500Names[,1])
lab2<- substring(SP500Names[,1], 1, N- 10)
SP500Names[,1]<- lab2
ind2<-match( names(SP500Prices), SP500Names[,1])
SP500Names<- SP500Names[ind2,]
#dimnames(SP500percentChange)[[1]]<- time[-1]

save( SP500Prices, SP500PercentChange,SP500Names, file="SP500Daily.rda")



out<- hclust( dist( t(SP500PercentChange)))
plot( out)


