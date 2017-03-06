###APPM 2720 Homework 7

Due Monday February 15, 2015 midnight. 

Go to the web site [movies data set](http://had.co.nz/data/movies) that was set up by Hadley Wickham (developer of RStudio), download and read into R the movies data set. 
Also consult the [data description](http://had.co.nz/data/movies/description.pdf) from this site to figure out what is in this data and where it came from. 
To read in the movie.tab data file use 

````
m <- read.table("movies.tab", sep="\t",
   header=TRUE, quote="", comment="")
# to check 
head(m)
````

From these data consider the question: Is the production cost of a movie related to its ratings by viewers?

Keep in mind that there is no single right anwser to this homework. Try to limit your answer to one or two figures and a paragraph explaining your interpretation.  
##NOTES

In exploring this question you might want to look at subsets of the data (e.g. action movies, romance movies).

You may also want to consider a subset where the number of votes is large enough to get a reliable estimate of the rating. (I would recommend having at least a few hundred votes.)

The size of movies budgets can vary greatly. You may want to examine the log10 of the budget instead of the raw value. There are two ways to look at log values using the plot function:

````
x<- c( 1, 5, 10 ,100, 1000, 3000, 50000)
y<-c(1:6,20)
# not very helpful
plot( x,y) 
# log x directly
xlog<- log10( x)
plot( xlog, y)
# log the x axis in the plot
plot( x,y, log="x")
````
Note how the x axis is labeld differently for these two 
choices. 



 






