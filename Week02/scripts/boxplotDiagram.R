# draws boxplot example to use in Lecture2.2 notes
library( dataWorkshop)
data( AudiA4)
# or 
fields.style()
# mileage from audi data set used as example 
y<- AudiA4$mileage/1000
par( mar=c(3,5,1,1))
plot( c(.5,2.5), c(0,200),xlab="", type="n",
      xaxt="n",ylab="mileage (1000)")

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
# NOTE: | used in logical means "or" 
outliers<- y[  (y > W2) | (y < W1) ]
text(1.3,outliers, " outlier" )
# add the actual data to show how difficult it is to see this information
# but thi
points(rep( .5, length( y)), y, pch=16, cex=.6,col="black")
# dump the plot to a file in jpeg format

dev.print( jpeg, filename="boxplotFigure.jpeg", height=600, width=600,
           bg = "white")

