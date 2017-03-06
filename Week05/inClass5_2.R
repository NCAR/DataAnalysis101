library(dataWorkshop)

# set working directory to Week5

# Q read in the tornado data (2014_torn.csv) as a data.frame
# Also included with the torando data is a short description of the columns
# see SPC_severe_database_description

tornado<- read.csv( "2014_torn.csv")
tornado<- read.csv( "2014_torn.csv", header=FALSE)

#  Why do you need to add header=FALSE to this read function?

# Q What state had the largest number of reported tornados? (See V8)
tabState<- table(tornado[,8])
max( tabState)
 ind<- tabState== max( tabState)
 tabState[ind]

# Q Create a subset of this data set to include columns c(3,11, 16:19)
# rename these as 
#   c( "month", "Fnumber", "lat1", "lon1", "lat2", "lon2") 
# using the  names function
# 
 tornado2<- tornado[,c(3,11, 16:19) ]
 names(tornado2 ) <- c( "month", "Fnumber", "lat1", "lon1", "lat2", "lon2")
 
 head( tornado2)
 tail( tornado2)
 
 table(tornado2$Fnumber )
 
 

# Q  plot the start locations (lon1, lat1) and 
# color the points by the Fnumber
# add a US map ( US( add=TRUE) )
 
plot( tornado2$lon1,tornado2$lat1,
      xlim = c(-125,-63 ),
      ylim = c( 25, 50),
       col = tornado2$Fnumber + 1,
       pch=20, cex=.5)

# map("usa", add=TRUE)
US( add=TRUE)

# D Nychka's choices
par( mar=c(0,0,0,0))
plot( tornado2$lon1,tornado2$lat1,
      xlim = c(-125,-63 ),
      ylim = c( 25, 50),
      col = tornado2$Fnumber + 1,
      pch=20, cex=.5,
      axes=FALSE, xlab="", ylab="")

# map("usa", add=TRUE)
US( add=TRUE)

 
 


 
# more on parsing adventures of sherlock holmes 
#################### 
# simplest solution
everything0<- scan( "SherlockHolmes.txt", what="raw")

everything<- scan("SherlockHolmes.txt", what="a", quote='@@')
# idea is that @@ does not appear anywhere in the doc and so nothing is
# considered a quoted series of words.
# omit foreign characters
everything<- enc2utf8(everything )
# omit title page and table of contents etc.
N1<- length( everything)
everything<- everything[ 300 : N1]
# omit end part with legal stuff
N2<- grep("***", everything, fixed=TRUE)
nEnd<- (N2[1]-1)
everything<- everything[ 1 : nEnd  ]

#  get rid of punctuation and an example of the gsub function
everything2<- gsub('[;,:\"]','', everything )

#########
##### [ character_group ]	Matches any single character in character_group.
##### By default, the match is case-sensitive.

everything2<- gsub('--',' ', everything2, fixed=TRUE )

# add a fixed tag where the sentence ends
everything3<- gsub('[.?!]',' XXX ', everything2 )
# rescan 
everything4<- scan( text= everything3, sep=" ", what="raw", quote='@@')
everything4<- everything4[ everything4!=""]
# number of unique words
length( unique( everything4))
# 100 most frequent words
wordCount<- table( everything4)
wordCount<- sort( wordCount, decreasing=TRUE)
wordCount[1:200]

# check it!
sum( everything4=="Holmes")
# locations of Holmes in the data set
index<- grep( "Holmes", everything4)
everything4[index]

# "word" length  table 
lengthWord<- nchar(everything4)
table(lengthWord  )
# save( everything4, file="everything4.rda")
###############################################
#Q save this cleaned up version as an R binary file.

#Q Use the locations of ADVENTURE in this text to find the story breaks
# create a variable that indicates which story (e.g. 1:12) each word comes from.

#Q What are the lengths of the different stories?

#Q Use the XXX to find the sentence breaks. What is 
# the distribution of the number of words in the sentences?








