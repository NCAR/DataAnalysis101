#APPM2720 Homework 4
*Due Wednesday February 3, 2016 by 12PM.

This is short assignment to reinforce the class work on 
for loops for plotting parts of data sets.

Refer to the R script RintroProgamming1.R in the class  [Week4](http://www.image.ucar.edu/~nychka/Temp/APPM2720/Week4/) folder. 

Work through this R code (but you do need to submit any work) and answer the data challenge:
````# Q create a plot to investigate the years when the mean and median differ.````

--

See the HINT in the R code to draw lines for each year
across the  12 months and also the code to just draw those with a mean - median difference greater than 3. 

Modify this for loop to highlight years (e.g. using a different color) where the mean and median differ signficantly. 

Some helpful points:

- The ````if```` statement in the for to only plot when there is a complete years worth of data. The ````!```` negates all the TRUE FALSE values so ````!is.na(stuff) ```` is TRUE for stuff that is not an NA and FALSE if an NA.
- The absolute value function in R is ````abs````. So use ````abs( mean( tempData) - median(tempData)````
to find the absolute difference.
-  I found it helpful to plot ````tempData - median(tempData)```` instead of just ````tempData```` because the plotted curves will have a median of zero and a mean of the original data minus the median. If you do this, however, change the limits in the plot statement to something like ````ylim=c( -40,20)```` to reflect this switch of scales. 
- lines are plotted in order and later curves can over plot the previous ones obscuring them. So use thin lines and/or plot the most interesting curves last.  

 

