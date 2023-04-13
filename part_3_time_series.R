# Time series analysis

# Greenland increase of temperature ----
# Data and code from Emanuela Cosma

library(raster)
library(rasterVis)
library(rgdal)

setwd("C:/lab/greenland")

# raster() function to import (tif) images with single layers
lst_2000 <- raster("lst_2000.tif")
lst_2005 <- raster("lst_2005.tif")
lst_2010 <- raster("lst_2010.tif")
lst_2015 <- raster("lst_2015.tif")

# rast() function for using the terra package

ls()  # list of objects imported and loaded

# plotting in a multiframe
par(mfrow = c(2,2))
plot(lst_2000)
plot(lst_2005)
plot(lst_2010)
plot(lst_2015)

# list of files:
rlist <- list.files(pattern = "lst")
rlist
class(rlist)

import <- lapply(rlist, raster)  # to apply a function to many files of a list
import
class(import)

TGr <- stack(import)  # or terra::c within terra package
TGr
plot(TGr)

plotRGB(TGr, 1, 2, 3, stretch = "Lin")
plotRGB(TGr, 2, 3, 4, stretch = "Lin")
plotRGB(TGr, 4, 3, 2, stretch = "Lin")

cl <- colorRampPalette(c("blue","lightblue","pink","red"))(100)
plot(TGr, col = cl)

dev.off()

# difference between 2005 and 2000:
dift = TGr[[2]] - TGr[[1]]

cl <- colorRampPalette(c("blue","lightblue","pink","red"))(100)
plot(dift, col = cl)

# install.packages("terra")
library(terra) 

# rast function from terra package 

test <- rast("C:/lab/greenland/lst_2005.tif")  # used rather than the raster function

plot(test)


# levelplot(TGr)
cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)
plot(TGr, col = cl)

levelplot(TGr, col.regions = cl,
          names.attr = c("July 2000","July 2005", "July 2010", "July 2015"))
levelplot(TGr, col.regions = cl, main = "LST variation in time",
          names.attr = c("July 2000","July 2005", "July 2010", "July 2015"))

dev.off()



#NO2 decrease during the lockdown period ----

library(raster)

setwd("C:/lab/en")

# importing the first image file
en01 <- raster("EN_0001.png")
en01
plot(en01) # it's January, before the lockdown

cl <- colorRampPalette(c('red','orange','yellow'))(100) #
plot(en01, col = cl)

en13 <- raster("EN_0013.png")
plot(en13, col = cl) # it's March, after lockdown began

# Let's import the whole set (altogether!)

# Exercise: import the whole as in the Greenland example
 # by the following steps: list.files, lapply, stack

rlist_2 <- list.files(pattern = "EN")
rlist_2

# lapply(X, FUN)
rimp <- lapply(rlist_2, raster)
rimp

# stack
en <- stack(rimp)
en

# plot everything
plot(en, col = cl)

# Check
par(mfrow = c(1,2))
plot(en[[1]], col = cl)
plot(en01, col = cl)
dev.off()
dif_check <- en01 - en[[1]]
dif_check
plot(dif_check)
dif_check_13 <- en13 - en[[13]]
dif_check_13
plot(dif_check_13)
dev.off()

# Exercise: plot first and last images
par(mfrow = c(1,2))
plot(en[[1]], col = cl)
plot(en[[13]], col = cl)

# or:
en113 <- stack(en[[1]], en[[13]])
plot(en113, col=cl)

# let's make the difference:
difen <-  en[[1]] - en[[13]]
cldif <- colorRampPalette(c('blue','white','red'))(100) #
par(mfrow=c(1,1))
plot(difen, col=cldif)

# plotRGB of three files together
par(mfrow=c(2,1))
plotRGB(en, r=1, g=7, b=13, stretch="lin")
plotRGB(en, r=1, g=7, b=13, stretch="hist")
