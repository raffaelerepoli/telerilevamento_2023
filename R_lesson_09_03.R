# Firts lesson of Remote Sensing in GitHub

# Let's install the raster package
install.packages("raster")
library(raster)

# Import data and setting the working directory
setwd("C:/lab")

image_2011 <- brick("p224r63_2011_masked.grd")

# plotting data in a raw way
plot(image_2011) # default legend

colors <- colorRampPalette(c("red", "orange", "yellow")) (100) # n° of shades
colors_3 <- colorRampPalette(c("red", "orange", "yellow")) (3)

# plotting with colors we chose
plot(image_2011, col = colors)

# plotting just one element
plot(image_2011[[4]], col = colors)

nir <- image_2011$B4_sre # another way to plot it
plot(nir, col = colors)

plot(nir, col = colors_3) # less shades worse image
