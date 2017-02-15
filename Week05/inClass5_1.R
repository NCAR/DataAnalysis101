library(dataWorkshop)

# set working directory to Week5

# check it!
getwd()
# handy function to list out files in working directory
list.files()

# naming a data frame
# first create a small data frame from three vectors
V1<- 1:6
V2<- c("oneFish", "twoFish", "redFish", "blueFish", "DrSuess","oneFish" )
V3<- V1 < 3
test<- data.frame( V1, V2, V1^2, V3)
names( test) <- c("numbers", "words", "squares","TRUEorFALSE" )
row.names( test) <- c("a", "b", "c", "d", "epsilon","f")
#
#
# Read in a data set from a file

primes<- scan( "First1000Primes.txt")
length( primes)
diffPrimes<- diff(primes)
# now try to read 
primes<- scan("RawFirst1000Primes.txt")
primes<- scan("RawFirst1000Primes.txt", what="raw")
head( primes)
primes<- primes[16:1015] #  primes[(1:1000) + 15 ]
 primes<- strtoi(primes)
 

primes<- scan("RawFirst1000Primes.txt", skip=4, what="raw")
primes<- strtoi(primes[1:1000])

primes<- scan("RawFirst1000Primes.txt", skip=4, what="raw",
              nlines=100)

primes<- scan("RawFirst1000Primes.txt",
              skip = 4,
              what = "raw",
              n = 1000)
# here is the most compact solution proposed to me after class
primes<- na.exclude(
                  as.numeric( 
                    scan("RawFirst1000Primes.txt", what="raw") 
                    )
                    )


# reading in the Sherlock Holmes text
everything<- scan("SherlockHolmes.txt", what="a")
length( everything)
### see inClass5_2.r for more on parsing this text 


# reading in a data frame and the pesky problems with factors
#
look<- read.table( "testDataFrame.txt")
# read in so character data is just strings not factors 
look2<- read.table( "testDataFrame.txt", stringsAsFactors=FALSE)

# extracing parts of a factor
 as.numeric(look$words) # note 3 occurs twice to indicate oneFish
 levels( look$words)
 
 
 




