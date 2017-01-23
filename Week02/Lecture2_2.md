

#APPM 2720 Lecture 2.2
----

# Using built in functions in R and writing your own.

See the script **Rfunctions.R** 

# Using the apply function 
See **Rapply.R**

The apply finds statistics for subgroups of the data
 
 - **apply** for regular tables to find stats for say the rows or columns
 - **tapply** for stats where the subgroups are given by different catgeories
 - **lapply** for stats where the subgroups are the components of a list.
 
 #Boxplots - a quick definition
 Invented by John Tukey as an alternative to a histogram.
 
 - Notch: a line at the median of the data
 - upper and lower hinge ( 25% and 75% quartiles)
 - box joins the hinges
 - inner fence  +1.5 IQR from each edge of box 
 - whiskers line from box to last observation before the inner fences
 - points beyond fences are plotted individually and are considered unusual

 #An example: mileage (1000s) AudiA4 dataset
 ![](boxplotFigure.jpeg =200x)
 
 
  