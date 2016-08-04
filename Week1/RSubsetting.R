
# load a data set 
# NOTE this assumes that your R session has the file BT.rda in the
# working directory. To change/ set the working directory
# use:  Tools | Change Working Dir... menu
# or on a mac:  Session | Set Working Directory 

load( "BT.rda")
# how do we see what happened?

# copy for easy typing
BT  <- BoulderJuneTemperature$Temp
BAll<- BoulderJuneTemperature

# How would you convert temperatures to centigrade?

# first 10 values
  BT[1:10]
# an indicator for all values over 70
  ind70<- BT > 70
  ind70
# for arithmetic ind70 will be converted to 0 and 1
#  try  sum( ind70)
  
# temperatures with values over 70
  BT[ind70]
  
# the years with values over 70
  BAll$Year[ ind70]
  
# Q How many years exceed 70 degrees?
# Hint: if ind is a logical variable sum(ind)
# will give the number of TRUE values.

#Q What is the first year the the temperature was above 70?
# Hint:   
  
# working with these data as a matrix (or table)
dim( BAll)
# This is the first row and first column
BAll[1,1]
# first row
BAll[1,]
# first column
BAll[,1]
# column with Year (this is also column 1)
BAll[,"Year"]
# second column (could also use "Temp" to refer to this)
BAll[,2]
# rows 10 through 20
BAll[10:20,]

#Q What is the diffence between  BT[hold] and BAll[hold,] ?

#Q Plot the June temperatures by year







