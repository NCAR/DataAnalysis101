library(dataWorkshop)

# set working directory to Week5

# check it!
getwd()
# handy function to list out files in working directory
list.files()

# naming a data frame
# first create a small data frame from three vectors
V1<- 1:5
V2<- c("one", "two", "three", "four", "five")
V3<- V1 < 3
test<- data.frame( V1, V2, V1^2, V3)
names( test) <- c("numbers", "words", "squares","TRUEorFALSE" )
row.names( test) <- c("a", "b", "c", "d", "epsilon")
#
#
# Read in a data set from a file

primes<- scan( "First1000Primes.txt")
length( primes)

# now try to read 
primes<- scan("RawFirst1000Primes.txt")

#Q1 figure out how to add arguments to the scan function to 
# get it to work for RawFirst1000Primes.txt

# reading in the Sherlock Holmes text
everything<- scan("SherlockHomes.txt", what="a")
length( everything)

# reading in a data frame and the pesky problems with factors
#
look<- read.table( "testDataFrame.txt")

# commenting out and editting problematic data lines. 
read.table( "exchange.txt")

# nuclear option:
look<- scan( "exchange.txt", sep="\n", what="a")
length( look)
for( k in 1:8){
  hold<- scan( text=look[k], sep=" ", what="a")
#  cat( "line",  k, "items ", length( hold) , fill=TRUE)
}

# read in the SP500Yahoo.csv data. 
# do you think there is a relationship between the spread during the day
# and the volume. 

# Q2 read in the tornado data (2014_torn.csv) as a data.frame
# Also included with the torando data is a short description of the columns
# see SPC_severe_database_description

#  Why do you need to add header=FALSE to this read function?

# Q3 What state had the largest number of reported tornados? (See V8)

# Q4 Create a subset of this data set to include columns c(3,11, 16:19)
# rename these as 
#   c( "month", "Fnumber", "lat1", "lon1", "lat2", "lon2") 
# using the  names function
# 

#Q5  plot the start locations (lon1, lat1) and 
# color the points by the Fnumber
# add a US map ( US( add=TRUE) )


 
####################### some solutions

#########################################################

#Q3
tempData <- read.csv( "2014_torn.csv", header=FALSE)
 tableTornado<- table( tempData[,8])
 
#Q4
tornado<- tempData[, c( 3,11, 16:19)]
names( tornado)<-  c( "month", "Fnumber", "lat1", "lon1", "lat2", "lon2") 
#Q5
library( fields)
plot( tornado$lon1, tornado$lat1, pch=16, col=tornado$Fnumber+1, cex=.75,
      xlim=c(-125,-65), ylim=c(25,50))
US( add=TRUE)
world( add=TRUE, col="grey")



#################### got a bit carried away below on parsing this data
everything<- scan("SherlockHomes.txt", what="a", quote='@@')
# idea is that @@ does not appear anywhere in the doc and so nothing is
# considered a quoted series of words. 
length( everything)

# attempt to get rid of punctuation and an example of the gsub function
everything2<- gsub('[;.,!?:\"]','', everything )

# 100 most frequent words
wordCount<- table( everything2)
wordCount<- sort( wordCount, decreasing=TRUE)
wordCount[1:100]
# check it!
sum( everything2=="Holmes")
# locations of Holmes in the data set
index<- grep( "Holmes", everything2)
everything2[index]

# "word" length  table (many of these are not really words!)
table(   nchar( unique(everything2), allowNA=TRUE))
###############################################




