# CLASSIFICATION OF REMOTE SENSING DATA VIA RSTOOLBOX

# Installing devtools
# install.packages("devtools")
library(devtools)

# devtools::install_github("bleutner/RStoolbox")
library(RStoolbox)

setwd("C:/lab")

library(raster)

sun <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
plotRGB(sun, 1, 2, 3, stretch = "Lin")
plot(sun)







