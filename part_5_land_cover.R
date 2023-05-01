library(raster)
# install.packages("ggplot2")
library(ggplot2) # for ggplot graphs
# install.packages("patchwork")
library(patchwork) # for multiframes with ggplot2

setwd("C:/lab/")

defor1 <- brick("defor1_.png")
defor2 <- brick("defor2_.png")

# NIR 1, RED 2, GREEN 3

par(mfrow=c(2,1))
plotRGB(defor1, 1, 2, 3, stretch="lin")
plotRGB(defor2, 1, 2, 3, stretch="lin")

# 1. Get all the single values
singlenr1 <- getValues(defor1)
singlenr1

# 2. Classify
kcluster1 <- kmeans(singlenr1, centers = 2)
kcluster1

# 3. Recreating an image
defor1_class <- setValues(defor1[[1]], kcluster1$cluster) # assign new values to a raster object

plot(defor1_class)

# class1: forest
# class2: bare soil

#---- Classification of the 2006 image

# 1. Get all the single values
singlenr2 <- getValues(defor2)
singlenr2

# 2. Classify
kcluster2 <- kmeans(singlenr2, centers = 2)
kcluster2

# 3. Recreating an image
defor2_class <- setValues(defor2[[1]], kcluster2$cluster) # assign new values to a raster object

plot(defor2_class)

# class1: forest
# class2: bare soil

#--- multiframe

par(mfrow = c(2,1))
plot(defor1_class)
plot(defor2_class)

#--- Class percentages

frequencies1 <- freq(defor1_class)
frequencies1

tot1 <- ncell(defor1_class)
tot1

percentages1 <- frequencies1 * 100 / tot1
percentages1

#---- 2006

frequencies2 <- freq(defor2_class)
frequencies2

tot2 <- ncell(defor2_class)
tot2

percentages2 <- frequencies2 * 100 / tot2
percentages2

# forest: 52.07
# bare soil: 47.93

# let's make a dataframe
cover <- c("Forest","Bare soil")
percent_1992 <- c(89.75, 10.25)
percent_2006 <- c(52.07, 47.93)
percentages <- data.frame(cover, percent_1992, percent_2006)
percentages

# First plot using ggplo2
ggplot(percentages, aes(x = cover, y = percent_1992, color = cover)) +
  geom_bar(stat = "identity", fill = "white")
 # we wanna know the identity for this kind of statistics, not the count
  # we already have the data we meed for the plot

ggplot(percentages, aes(x = cover, y = percent_2006, color = cover)) +
  geom_bar(stat = "identity", fill = "white")

# patchwork
p1 <- ggplot(percentages, aes(x = cover, y = percent_1992, color = cover)) +
  geom_bar(stat = "identity", fill = "white") +
  ggtitle("Year 1992")

p2 <- ggplot(percentages, aes(x = cover, y = percent_2006, color = cover)) +
  geom_bar(stat = "identity", fill = "white") + 
  ggtitle("Year 2006")

p1 + p2

# using patchwork to compare the plots
p1 <- ggplot(percentages, aes(x = cover, y = percent_1992, color = cover)) +
  geom_bar(stat = "identity", fill = "white") +
  ggtitle("Year 1992") + #mioermette di dare un titolo ai diversi grafici
  ylim(c(0,100))

p2 <- ggplot(percentages, aes(x = cover, y = percent_2006, color = cover)) +
  geom_bar(stat = "identity", fill = "white") +
  ggtitle("Year 2006") +
  ylim(c(0,100)) #ylim mi permette 

p1 + p2

# in order to standardize the y axes of the 2 plots we use ylim() function

