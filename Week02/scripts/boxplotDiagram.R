
library( dataWorkshop)
data( AudiA4)
fields.style()
y<- AudiA4$mileage/1000
par( mar=c(3,3,1,1))
plot( c(.5,2.5), c(0,200),xlab="", ylab="", type="n",
      xaxt="n")
statsBP<- boxplot( y, col="green4", add=TRUE)
par(xpd=TRUE)
text( 1.2,median(y)," <- Median (notch)", adj=0)
Q25<- quantile(y, .25)
Q75<- quantile(y, .75)
text( 1.2,Q25," <- 25% (lower hinge)", adj=0)
text( 1.2,Q75," <- 75% (upper hinge)", adj=0)
IQR<- Q75 - Q25
W2<- max( y[ y < ( Q75 +  1.5* IQR ) ])
W1<- min( y[ y > ( Q25 -  1.5* IQR )] )
text( 1.2,W2," <- whisker", adj=0)
text( 1.2,W1," <- whisker", adj=0)
outlier<- y[  y > W2 | y < W1]
text(1.3,outlier, " outlier" )
#points(rep( .5, length( y)), y, pch=15, cex=.4,col="grey20")
dev.print( png, filename="boxplotFigure.png", height=480, width=480)

