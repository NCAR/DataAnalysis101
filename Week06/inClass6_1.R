# From last week 
# lamborgini segmentation
# Pix of Kota

look<- scan( "Used Lamborghini - in 80305 - on Cars.com.html", what="a'")
car1<- look[2949: (2960-1)]
strsplit( car1[5], ",")

colors()
plot( 1:10, col="blueviolet", pch=16, cex=4)

col2rgb( "blueviolet")/256 # out of 256

testColor<- rgb( .539, .168, .883 )
plot( 1:10, cex=4, col=testColor, pch=16)

testColor<- rgb( 1.0, 1.0, 0 )
plot( 1:10, cex=4, col=testColor, pch=16)

testColor<- rgb( 1.0, 0, 1.0 )
plot( 1:10, cex=4, col=testColor, pch=16)

testColor<- rgb( .5, .5, .5 )
plot( 1:10, cex=4, col=testColor, pch=16)

plot( 1:10, cex=4, col=colors()[1:10], pch=16)


library( fields)
image( matrix(1:10,10,1), col=colors()[1:10],
            axes=FALSE, xlab="", ylab="")





# Q0 build a simple function to view a color in R from [0,1] RGB values

#
# the test image in the Week6 file testI1.txt is a 
# 11X17  highly averaged image of the lennon image matrix

# Q1 read it in using scan
# and reformat to an image matrix using  the array function
# you can plot it using the image function with 
# col=greyScale



 look<- scan("testI1.txt" )
 look2<- array( look,c(11,17) )

 image(look2, col=tim.colors(256))
 
 greyScale<- grey( seq( 0,1, length.out= 256))
 
 image(look2, col=greyScale)
 
 # refering to pixel locations
 
 image(1:11, 1:17, look2, col=greyScale)
 points( 8, 12, col="red")
 
 data( lennon)
 image(lennon, col=greyScale)
 

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

CULogo[200,250, ]

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


  set.panel(2,1)
  data( lennon)
# the raster format is different than the image format
#  (switches the roles of X and Y) and flips top to bottom
# it also wants to have the color levels between 0 and 1.  
  test0<- as.raster(lennon/255)
  plot( test0)
  
  N<-ncol( lennon) # should be the number of columns the lennon image
  testGood <- lennon[,N:1] # flip top and bottom
  testGood<- aperm(testGood , c(2,1) ) #switch X and Y
  testGood<- as.raster( testGood/255)
  plot(  testGood)
  
#NOTE that in this example the as.raster is smart in that
# if it gets a single image matrix it assumes is grey scale
# and creates the grey scale color codes.


