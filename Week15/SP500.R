library( dataWorkshop)

load("SP500Daily.rda")

dim( SP500Prices)
dim ( SP500PercentChange)
SP500Mean<- apply(SP500PercentChange, 1, "mean" )
time<- rownames(SP500PercentChange )
plot(as.Date( time), SP500Mean, type="h" , lwd=3, col="grey")
lines(as.Date( time), SP500PercentChange[,"NFLX"], col="red" , type="h")
lines(as.Date( time), SP500Mean, lwd=3, col="grey")

corSP<- cor(SP500PercentChange )

temp<- as.matrix( SP500PercentChange)
temp<- t( temp)
d <- dist(temp) # euclidean distances between the rows
fit <- cmdscale(d,eig=TRUE, k=2) # k is the number of dim
plot(fit$points) # view results
text(fit$points, labels= SP500Names[,1])
fit2<- hclust(d)
plot( fit2)
cluster5<- cutree(fit2, k=5)
cluster10<- cutree(fit2, k=10)

colscale<- rainbow(10)
indcolor<-as.numeric( cluster10)
plot(fit$points) # view results
text(fit$points, labels= SP500Names[,1], col= colscale[indcolor ])


fit3d <- cmdscale(d,eig=TRUE, k=3)

library( rgl)

plot3d(fit3d$points, col=colscale[indcolor ])