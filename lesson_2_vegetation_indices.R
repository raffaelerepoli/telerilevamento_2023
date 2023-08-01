# Calculating spectral indices

library(raster)

setwd("C:/lab/")


# IMAGE OF 1992 ----

# Import the image.png of 1992 from our wd
l1992 <- brick("defor1_.png")
l1992

# Plotting images with plot() and plotRGB()
plot(l1992)  # 3 layers
plotRGB(l1992, 1, 2, 3, stretch = "Lin")

# What is NIR? NIR is red since the image is red
# NIR = 1
# red = 2
# green = 3

# images exported by NASA with NIR, first band is 1

# calculate DVI for 1992
dvi1992 = l1992[[1]] - l1992[[2]]  # NIR - red
dvi1992

# plotting the DVI
cl <- colorRampPalette(c("darkblue", "yellow", "red", "black"))(100)
plot(dvi1992, col = cl) 
# the darker the red the healthier the vegetation

plot(l1992)
# reflectance is between 0 and 255
# information theory of Shannon -> bit (0, 1)
# this image is in 8 bits
2 ^ 8  # total values

# so the DVI image range is -255 to 255, because red is 0 - 255


# IMAGE OF 2006 ----

# Import the most recent image
l2006 <- brick("C:/lab/defor2_.png")
l2006

# Plotting images with plot() and plotRGB()
plot(l2006)
plotRGB(l2006, 1, 2, 3, stretch = "Lin")

# calculate DVI for 2006
dvi2006 = l2006[[1]] - l2006[[2]]

# plotting the DVI
plot(dvi2006, col = cl) 

# Exercise: plot the image from 1992 ontop of that of 2006
par(mfrow = c(2, 1))
plotRGB(l1992, 1, 2, 3, stretch = "Lin")
plotRGB(l2006, 1, 2, 3, stretch = "Lin")

# Exercise: plot the image from 1992 beside that of 2006
par(mfrow = c(1,2))
plotRGB(l1992, 1, 2, 3, stretch = "Lin")
plotRGB(l2006, 1, 2, 3, stretch = "Lin")

dev.off()


# TIME DIFFERENCE ----

# plotting the DVI of 1992 and 2006 in a multiframe
par(mfrow = c(1, 2))
plot(dvi1992, col = cl) 
plot(dvi2006, col = cl) 

dev.off()

# Multitemporal analysis: calculate the difference of DVI from 1992 to 2006
dvi_dif = dvi1992 - dvi2006

# Plotting the results of multitemporal analysis
cld <- colorRampPalette(c("blue", "white", "red"))(100)
plot(dvi_dif, col = cld) # the higher the difference the bigger the deforestation

# if the difference is negative there is a gain in forest cover

# the number of bits of an image is "radiometric resolution"


# NDVI ----
# NDVI = Normalized Difference Vegetation Index

ndvi1992 = dvi1992 / (l1992[[1]] + l1992[[2]])  # standardization
plot(ndvi1992, col = cl)  # now the index is standard, from -1 to +1

ndvi2006 = dvi2006 / (l2006[[1]] + l2006[[2]])
plot(ndvi2006, col = cl)

# calculating differences of ndvi between 1992 and 2006
ndvi_dif = ndvi1992 - ndvi2006
plot(ndvi_dif, col = cld)
