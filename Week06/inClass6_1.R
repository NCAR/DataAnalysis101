# From last week 
# lamborgini segmentation
# Pix of Kota

library( fields)

# Q0 build a simple function to view a color in R from [0,1] RGB values

#
# the test image in the Week6 file testI1.txt is a 
# 11X17  highly averaged image of the lennon image matrix

# Q1 read it in using scan
# and reformat to an image matrix using  the array function
# you can plot it using the image function with 
# col=greyScale
  greyScale<- grey( seq( 0,1,,256))

#Q2 read in the version testI2.txt
#
# This has the rows and columns diabolically flipped
# use the array function  with c(17,11) to format
# then use aperm to unflip. the final result should look like Q1

#Q2 EXTRA CREDIT:  read in testI3.txt 
# take a look at this file in an editor to see its format 
# Use this file format to automatically set the
# row and column sizes for the array function

# reading in a jpeg image and converting to image format
# 
library(jpeg)
CULogo<- readJPEG("Colorado-Buffaloes-Logo.jpg")
#Q3 How large is this image?

#plotting this image:
library( raster)
rasterCULogo<- as.raster( CULogo)
plot( rasterCULogo)



#Q4 what is the color in RGB of the pixel 
#  200, 250 ? 
# Note in the raster format this is at location 
#  X= 250 and Y= 200 

#Q5 How would you flip this image left to right?

#Q8 How would you convert this image to grey scale values. 

#Q9 How many different colors are in this image?

### A edge detection example
#Here is how to look for big differences in adjacent rows  and columns
#of pixels. Use a different color scale because images now 
#make sense as numerical values.

# finding edges in lennon image.
set.panel(3,1)
image(1:256, 1:256,lennon/255 , col= greyScale, axes=FALSE,
      xlab="", ylab="")

testImage<- lennon[1:255,1:256] - lennon[2:256, 1:256]
image.plot( testImage,
            col= tim.colors(256))

testImage<- lennon[1:256,1:255] - lennon[1:256, 2:256]
image.plot( testImage,
            col= tim.colors(256)) 

# Q9 find some edges in the Norlin Quad image.  CUNorlinQuad.jpg

  

  set.panel(2,1)
  data( lennon)
# the raster format is different than the image format
#  (switches the roles of X and Y) and flips top to bottom
# it also wants to have the color levels between 0 and 1.  
  test0<- as.raster(lennon/255)
  plot( test0)
  
  N<-ncol( lennon) # should be the number of columns the lennon image
  testGood <- lennon[,N:1] # flip top and bottom
  testGood<- aperm(testGood , c(2,1) ) #switch X nad Y
  testGood<- as.raster( testGood/255)
  plot(  testGood)
  
#NOTE that in this example the as.raster is smart in that
# if it gets a single image matrix it assumes is grey scale
# and creates the grey scale color codes.


