# Calculating spectral indices

library(raster)

setwd("C:/lab/")

# IMAGE OF 1992 ----

# Import the images .png from our wd
image_1992 <- brick("C:/lab/defor1_.png")
image_1992  # from 1992

# Plotting images with plot() and plotRGB()
plot(image_1992)
plotRGB(image_1992)
plotRGB(image_1992, 1, 2, 3, stretch = "Lin")  # What is NIR?
# NIR is red since the image is red
# NIR = 1
# red = 2
# green = 3

# images exported by NASA with NIR, first band is 1

# calculate DVI for 1992
dvi1992 = image_1992[[1]] - image_1992[[2]]  # NIR - red
dvi1992

# plotting the DVI
cl <- colorRampPalette(c("darkblue", "yellow", "red", "black"))(100)
plot(dvi1992, col = cl) 
# the darker the red the healthier the vegetation

plot(image_1992)
# reflectance is between 0 and 255
# information theory of Shannon -> bit (0, 1)
# this image is in 8 bits
2 ^ 8  # total values

# so the DVI image range is -255 to 255
# because red is 0 - 255


# IMAGE OF 2006 ----

# Import the images .png from our wd
image_2006 <- brick("C:/lab/defor2_.png")
image_2006  # 2006

# Plotting images with plot() and plotRGB()
plot(image_2006)
plotRGB(image_2006)
plotRGB(image_2006, 1, 2, 3, stretch = "Lin")

# calculate DVI for 2006
dvi2006 = image_2006[[1]] - image_2006[[2]]

# plotting the DVI
plot(dvi2006, col = cl) 


# Exercise: plot the image from 1992 on top of that of 2006
par(mfrow = c(1, 2))
plotRGB(image_1992, 1, 2, 3, stretch = "Lin")
plotRGB(image_2006, 1, 2, 3, stretch = "Lin")
dev.off()


# TIME DIFFERENCE ----

# plotting the DVI of 1992 and 2006 in a multiframe
par(mfrow = c(1, 2))
plot(dvi1992, col = cl) 
plot(dvi2006, col = cl) 

dev.off()

# calculate the difference of DVI from 1992 to 2006
dvi_dif = dvi1992 - dvi2006
cld <- colorRampPalette(c("blue", "white", "red"))(100)
plot(dvi_dif, col = cld)
# the higher the difference the bigger the deforestation

# if the difference is negativa there is a gain in forest cover

# the number of bits of an image is "radiometric resolution"


# NDVI ----

ndvi1992 = dvi1992 / (image_1992[[1]] + image_1992[[2]])  # standardization
plot(ndvi1992, col = cl)  # now the index is standard, from -1 to +1

ndvi2006 = dvi2006 / (image_2006[[1]] + image_2006[[2]])
plot(ndvi2006, col = cl)

# calculating differences of ndvi between 1992 and 2006
ndvi_dif = ndvi1992 - ndvi2006
plot(ndvi_dif, col = cld)

