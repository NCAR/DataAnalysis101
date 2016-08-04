library( fields)
library( dataWorkshop)
data(AudiA4)

fields.style()

year<-  AudiA4[,1]
yfactor<-rep( NA, length( year))

yfactor[ year<=2003] <-1
yfactor[2004<= year & year<=2007]<-2
yfactor[2008<= year & year<=2011]<-3
yfactor[2012<= year & year<=2015]<-4

plot( AudiA4[,3]/1000, AudiA4[,2], col=yfactor,cex=.7, pch=16,
      ylab="Asking Price", xlab="Mileage (thousands)")
out<- sreg( AudiA4[,3]/1000, AudiA4[,2], df=4)
lines( out$predicted, col="grey30", lwd=4)
title("Used Audi A4 prices cars.com")

legend(  150,44000, legend=c("    -2003", "2004-2007", "2008-2011", "2012-2015"),
         col=1:4, pch=16)

dev.copy2pdf(file="A4.pdf")
