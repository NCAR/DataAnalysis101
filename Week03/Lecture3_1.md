# APPM27020 
#  Week 3 *Lecture 4*  
##**Plotting data**

This lecture will cover the basics of plotting data
using the ```plot``` and ```hist``` functions. 

###Some basic concepts for graphics:

- Put as much information on a figure as you can and still keep the message clear. 
 
- Always label the axes, give the plot a title and include legend if you plot different groups using different colors or symbols

- Think of your plotting region as a canvas and fill it up big blank areas are often confusing. 

- If you just have a few values to show consider just listing them as a table
 
- If you have lots of values to show try to plot them.  *Don't* just list them as a table.

- Different colors are helpful but use them sparingly


###Drawing plots in R

The ```plot``` has lots of options but the most important technique is build up a complex (and useful!) figure in several simpler steps.

- use a function such as ```plot ``` to draw the initial figure and set the axes scales, etc.

-  use some helper functions to add more information.
  - ```points(x,y)```
  
  - ```lines(x,y)```

  - ```text(x,y, label)```

- use additional options, ``` cex```, ```col``` ```pch``` , ```lwd``` and ```lty``` to adjust the size, color, plotting character, line width and line type.

- adjust the axis scales with ```xlim``` and ```ylim``` and use log scaling with  the ```log``` argument.

- Remember use the help function and search on the web you are probably not the first to have a particular question about plotting in R!
  
  
  Add a legend for the plot symbols or colors with the ```legend``` function (this takes a little practice to use it.)
  
  If you want a separate  and larger plotting window outside of R studio use the ```quartz()``` function to create one.
  
  Some other high level plot functions in R are
  ```hist``` ```matplot``` ```image``` and  ```persp```
  ```contour``` 
  
  
