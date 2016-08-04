#hold<- read.csv2( "~/Desktop/Russell_1k.csv")
hold<- scan("~/Desktop/Russell_1k.csv", sep="," , what="a")

hold2<- matrix( hold, ncol=752, byrow=TRUE)
hold3<- hold2[-1,-1]
hold3<- as.numeric( hold3)
prices<- matrix( hold3, ncol=751)
stocks<- hold2[-1,1]
days<- hold2[1,-1]
days<- as.Date( days,"%m/%d/%y" )
N<- ncol(prices)
returns<- 100*(prices[, 2:N] - prices[,1:(N-1)] )/ prices[,1:(N-1)]
days<- days[-1]
dayDiff<- diff( days)
ind4<- dayDiff<=3
returns<- returns[,ind4]
days<- days[ind4]

plot( days[-1],returns[1,], type="l")
ind1<- 310
ind2<- 397

meanRussell<- colMeans( returns)

fields.style()
plot( returns[ind1,], returns[ind2,],
          pch=16, cex=.8, col="grey40",
          xlab="Morgan Stanley",
          ylab="Goldman Sachs", xlim=c(-6,6), ylim=c(-5,5) )
title("Daily percent return Oct 2012 - Sep 2015" )
out<- sreg(returns[ind1,],returns[ind2,] )
lines( out$predicted, lwd=1.5, col="red4", lty=1)
index<-which.max(out$residuals)
points(returns[ind1,index],returns[ind2,index], col="red2",
       pch=16,cex=.8,)
text( returns[ind1,index],returns[ind2,index],
       labels=paste0("JAN 15, 2013"," --  "),
         adj=1, col="red2", cex=.8)
dev.copy2pdf(file="GSMS.pdf")

bplot.xy( returns[ind1,], returns[ind2,], pch=16, xlab=stocks[ind1],
      ylab=stocks[ind2], N=40, lwd=.5 )

bigC<- cor( t(returns) )

distMat<- 1- bigC^2
temp<- upper( distMat)
distMat<- distMat[temp]
hold<- hclust( distMat )

distMat<- dist( t( returns))







