# CLASSIFICATION OF REMOTE SENSING DATA VIA RSTOOLBOX

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
tot <- 2221440
percentages <- round((frequencies*100)/tot, digits = 5)
percentages

m1 <- matrix(frequencies, nrow = 3, ncol = 2)
m2 <- matrix(percentages, nrow = 3, ncol = 2)
data <- cbind(m1, m2)
data <- data[, -3]
data[, 3] <-  round(data[, 3], digits = 2)
data <- as_tibble(data)
colnames(data) <- c("class", "pixels", "freq")
data

