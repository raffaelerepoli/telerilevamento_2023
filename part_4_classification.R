# CLASSIFICATION OF REMOTE SENSING DATA

# Installing devtools
# install.packages("devtools")
library(devtools)

# devtools::install_github("bleutner/RStoolbox")
library(RStoolbox)

setwd("C:/lab")

library(raster)

# brick function for stratified files, raster for images with just one layer

sun <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
plotRGB(sun, 1, 2, 3, stretch = "Lin")
plot(sun)
plotRGB(sun, 1, 2, 3, stretch = "hist")

sun

# 1. Get values
single_nr <- getValues(sun)
# returns all values or the values for a number of rows of a Raster object
single_nr
# from the image with layers to the values of the reflectance of each layer

# 2. Classify
k_cluster <- kmeans(single_nr, centers = 3) # centers = num of classes/clusters
# clustering, Means = centroid of a cluster of pixels
k_cluster

# 3. Set values to a raster on the basis of the sun image
sun_class <- setValues(sun[[1]], k_cluster$cluster)
# from continues data to a raster object
# using the first layer of the sun image and cluster component of kmeans
# the first layer is like a box to be filled

cl <- colorRampPalette(c("yellow", "black", "red"))(100)
plot(sun_class, col = cl)

# class 1: highest energy level
# class 3: lowest energy level
# class 2: medium energy level


# What is the pixel size of high energy level? Talking about frequencies
frequencies <- freq(sun_class)
frequencies
tot <- ncell(sun_class)
percentages <- round((frequencies*100)/tot, digits = 5)
percentages

library(tidyverse)

m1 <- matrix(frequencies, nrow = 3, ncol = 2)
m2 <- matrix(percentages, nrow = 3, ncol = 2)
data <- cbind(m1, m2)
data <- data[, -3]
data[, 3] <-  round(data[, 3], digits = 2)
data <- as_tibble(data)
colnames(data) <- c("class", "pixels", "freq")
data



# day 2 Grand Canyon

grand_canyon <- brick("dolansprings_oli_2013088_canyon_lrg.jpg")
grand_canyon

# rosso = 1
# verde = 2
# blu = 3

plotRGB(grand_canyon, 1, 2, 3, stretch = "lin")

# change the stretch to histogram stretching
plotRGB(grand_canyon, 1, 2, 3, stretch = "hist")

# The image is quite big; let's crop it!
gc_crop <- crop(grand_canyon, drawExtent())
plotRGB(gc_crop, 1, 2, 3, stretch="lin")

ncell(grand_canyon)   # n of pixels of the original image
ncell(gc_crop)   # n of pixels of the cropped image


# classification

# 1. Get values
singlenr <- getValues(gc_crop)
singlenr

# 2. Classify
kcluster <- kmeans(singlenr, centers = 3)
kcluster

# 3. Set values
gcclass <- setValues(gc_crop[[1]], kcluster$cluster) # assign new values to a raster object

cl <- colorRampPalette(c('yellow','black','red'))(100)
plot(gcclass, col=cl)

# class 1: volcanic rocks
# class 2: sandstone
# class 3: conglomerates

frequencies <- freq(gcclass)
frequencies
tot <- ncell(gcclass)
percentages = frequencies * 100 /  tot
percentages


# Exercise: classify the map with 4 classes
singlenr_2 <- getValues(gc_crop)
singlenr_2

kcluster_2 <- kmeans(singlenr, centers = 4)
kcluster_2

gcclass_2 <- setValues(gc_crop[[1]], kcluster$cluster) # assign new values to a raster object

cl <- colorRampPalette(c('yellow','black','red', 'blue'))(100)
plot(gcclass_2, col=cl)

frequencies <- freq(gcclass_2)
tot <- ncell(gcclass_2)
percentages = frequencies * 100 /  tot
