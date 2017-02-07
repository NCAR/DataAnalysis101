#APPM2720  Spring 2017 Quiz 1
You should work on this quiz on your own;  do not get help from others. You are however, encouraged to use the web and any other reference materials and resources to complete these questions. 

*All nine numbered parts count for an equal amount of points.*

To make it easy to work this quiz all data sets are included in the [APPM2720 Quiz 1 directory](www.image.ucar.edu/~nychka/Temp/APPM2720/Quiz1). 

Please submit your work to me by email nychka@ucar.edu before midnight on Monday February 13, 2016. In your write ups, I recommend you include as much of your R code as insurance to get partial credit if you answer is not correct or complete. 

 You can submit your answers:

- in the body of an email and attach the plot

- use the markdown format in *Rstudio* along with the **knitr** button to create an html file that you email to me.

- add your text answers as comments in an R script use the notebook button and convert your R script to an html file.

In working these problems keep in mind the usefulness of the **table** function.

(1) Load the data set **BoulderJuneTemperature**

Show how to convert these temperatures  from Fahrenheit to the Kelvin temperature scale
(T(K) = (T(°F) + 459.67) × 5/9) and create a new data set with these values.
What is the relationship between the maximum of the original data and the maximum of the new data set? 

(2) If you made a boxplot of these data and the Y axis did not have a scale could you tell if the units were Kelvin or Fahrenheit? Explain your answer. 


The *National UFO Reporting Center* (NUFORC) is an organization in the United States that investigates UFO sightings and/or alien contacts. NUFORC has been in continuous operation since 1974. It was founded in 1974 by Robert J. Gribble. It has catalogued almost 90,000 reported UFO sightings over its history, most of which were in the United States. In addition to record keeping, the center has provided statistics and graphs to assist others looking for information.

*Kaggle* Source page: https://www.kaggle.com/NUFORC/ufo-sightings

This data set in the file **ufoQuiz1.rda** is the "scrubbed" version on Kaggle with a few additional variables added. It is called just ufo when loaded.

(3) How many rows and columns are in the data set **ufo**. Is this a matrix or a data frame?

(4) How many different UFO shapes are reported? What is the most common shape reported?

(5) Do you find any interesting relationships between the shape and the duration of the event? 
(The **tapply** function might be useful for finding stats by group.)

(6) Do you see any patterns in the number of sightings per year? How about as a function of the month? Use some plots to explain your answers. 

(7) Plot the locations of ufo sightings for the Rocky Mountain Region ( Rectangle of longitudes of -113 to -100 and latitudes of 33 to 46). Note: longitudes are the "x"" coordinates, latitudes are the "y".

You can add a map of the states using
```map("state", add=TRUE) ```
and with counties by
```map("counties", add=TRUE)```
See the help file on **map** for clues to change  the default colors and other features.

Make sure your plot is readable by adjusting the plot character size and also using more than one color. Using the  **points**  and **text** functions clearly label the location of Denver on your map.  

(8) What kind of patterns do you see for this region?  Do the patterns persist if you only look at the very long duration events ( e.g. greater than 3600 seconds == 1 hour)? 

Note: to create a logical index for say x, y values in a box
(a1, a2) by (b1,b2)   you can use:

 ``` ind <- (a1<= x) & (x<=a2) & ( b1<= y) & (y<=b2)```

(9) Dates are a little tricky to work with. This last question is an exercise in using several strategies to solve an R problem including:  the help function in R, the **lubridate** package, possibly the **substr** function, and web searching. 

Generate some R code that converts the strings of dates in the 
**datetime** column to the numeric years as given in the **year** column. 

(This is what was done to make this data set easier to use for this quiz. Keep in mind there is more than one way to do this.)

 

