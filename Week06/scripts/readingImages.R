library( fields)
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

#Q3 read in testI3.txt 
# take a look at this file in an editor to see its format 
# Use this file format to automatically set the
# row and column sizes for the array function

# reading in a jpeg image and converting to image format
# 
library(jpeg)
CULogo<- readJPEG("Colorado-Buffaloes-Logo.jpg")
#Q4 How large is this image?

#plotting this image:
library( raster)
rasterCULogo<- as.raster( CULogo)
plot( rasterCULogo)

#Q5 what is the color in RGB of the pixel 
#  750, 920 ? 
# Note in the raster format this is at location 
#  X= 920 and Y= 720 

#Q6 How would you flip this image left to right?

  
# rotating and flipping images
  data(lennon)
  test1<- lennon  
# flip image X and Y
  testFlip<- aperm( test1, c(2,1) )
#rotate image 90 clockwise
  test2<- aperm( test1, c(2,1) )
  N<- 256 # should be the number of columns of test2
  test2 <- test2[,N:1] # flip top and bottom
#rotate image 90 counterclockwise
  N<- 256 # should be the number of columns of test2
  test2B <- test1[,N:1] # flip top and bottom
  test2B<- aperm( test2B, c(2,1) )
#flip image right to left 
  test3<- test1[256:1,]
#flip image top and bottom 
  test4<- test1[, 256:1]
  
#  NOTE lennon is in **image** format use the image function to display these
 
  set.panel(2,1)
# the raster format is different than the image format
#  (switches the roles of X and Y) and flips top to bottom
  test0<- as.raster(lennon/255)
  plot( test0)
  N<- 256 # should be the number of columns of test2
  testGood <- lennon[,N:1] # flip top and bottom
  testGood<- aperm(testGood , c(2,1) ) #switch X nad Y
  testGood<- as.raster( testGood/255)
  plot( testGood)
#NOTE that in this example the as.raster is smart in that
# if it gets a single image matrix it assumes is grey scale
# and creates the grey scale color codes.


### A edge detection example
#Here is how to look for big differences in adjacent rows  and columns
#of pixels. Use a different color scale because images now 
#make sense as numerical values.


set.panel(3,1)
image(1:256, 1:256,lennon/255 , col= greyScale, axes=FALSE,
      xlab="", ylab="")

testImage<- lennon[1:255,1:256] - lennon[2:256, 1:256]
image.plot( testImage,
            col= tim.colors(256))

testImage<- lennon[1:256,1:255] - lennon[1:256, 2:256]
image.plot( testImage,
            col= tim.colors(256)) 

