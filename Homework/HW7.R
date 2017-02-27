

convertTime<- function(tt){
  N<- length( tt)
  minutes<- rep( NA, N)
  for( k in 1:N){
   minutes[k]<- convertSingleTime( tt[k])
   }
return( minutes)
 
}

convertSingleTime<- function(ts){
    tTemp <- as.character(ts)
# the next function returns a list instead of vector so convert it.    
  x<- unlist(strsplit( tTemp, ":"))
  mn <- as.numeric(x[1]) # this works even if minutes are say "04"
  sec<- as.numeric(x[2])
  return( mn + sec/60)
}


