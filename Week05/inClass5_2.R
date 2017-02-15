library(dataWorkshop)

# set working directory to Week5

# Q read in the tornado data (2014_torn.csv) as a data.frame
# Also included with the torando data is a short description of the columns
# see SPC_severe_database_description

#  Why do you need to add header=FALSE to this read function?

# Q What state had the largest number of reported tornados? (See V8)

# Q Create a subset of this data set to include columns c(3,11, 16:19)
# rename these as 
#   c( "month", "Fnumber", "lat1", "lon1", "lat2", "lon2") 
# using the  names function
# 

# Q  plot the start locations (lon1, lat1) and 
# color the points by the Fnumber
# add a US map ( US( add=TRUE) )


 
# more on parsing adventures of sherlock holmes 
#################### 
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
# 100 most frequent words
wordCount<- table( everything4)
wordCount<- sort( wordCount, decreasing=TRUE)
wordCount[1:100]

# check it!
sum( everything4=="Holmes")
# locations of Holmes in the data set
index<- grep( "Holmes", everything4)
everything4[index]

# "word" length  table 
lengthWord<- nchar(everything4)
table(lengthWord  )
###############################################

Q Use the locations of ADVENTURE in this text to find the story breaks

Q What are the lengths of the different stories?

Q Use the XXX to find the sentence breaks. What is 
the distribution of the number of words in the sentences?








