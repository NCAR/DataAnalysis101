load("SP500Daily.rda")
library( fields)
time<- rownames( SP500PercentChange)

SP500Mean<- apply( SP500PercentChange, 1, "mean")
plot( as.Date(time), SP500Mean, type="l")
lines( as.Date(time),SP500PercentChange[,"NFLX"], col="red" )


plot( as.Date(time),SP500PercentChange[,"NFLX"], col="red", type="l" )
lines( as.Date(time), SP500Mean, type="l", col="grey", lwd=3)

corSP<- cor( SP500PercentChange)

image.plot( corSP)

dSP<- dist( t( SP500PercentChange))
fit<- hclust( dSP)

plot( fit, cex=.1)

cluster5<- cutree(fit, k=5)

table( cluster5)

ind5<- as.numeric(cluster5 )
SP500Names[ind5>= 3, ]

fit1<- cmdscale( dSP, eig=TRUE, k=2)

plot( fit1$points)
#text( fit1$points, labels= SP500Names[,2], cex=.5)

cluster10<- cutree(fit, k=10)
colscale<- rainbow(10)
plot( fit1$points, col=colscale[ as.numeric(cluster10)],pch=16)

library( rgl)
fit2<- cmdscale( dSP, eig=TRUE, k=3)

plot3d( fit2$points, col=colscale[ as.numeric(cluster10)])

















