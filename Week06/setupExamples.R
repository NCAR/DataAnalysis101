library( fields)
library( jpeg)
data(lennon)
write( as.integer(lennon), ncol=10, file="lennonRaw.txt")
img <- readJPEG( "Rlogo.jpg")
write( as.integer(img*256), ncol=10, file="RlogoRaw.txt")

look<- average.image( lennon[50:225, ], 15)
testI<- round( look$z)
dim( testI)
write( c( testI), ncol=10, file="testI1.txt")
write( c( t(testI)), ncol=10, file="testI2.txt")

hold<- scan( "testI3.txt", skip=1)
look<- array( hold[-(1:2)], hold[1:2])



