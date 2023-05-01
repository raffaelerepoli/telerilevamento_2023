# VARIABILITY

setwd("C:/lab")

library(raster)
library(ggplot2)
library(patchwork)

sen <- brick("sentinel.png")
ncell(sen)

plot(sen)
plotRGB(sen, 1, 2, 3, stretch = "Lin")
# 1 = NIR, 2 = red, 3 = green

plotRGB(sen, 2, 1, 3, stretch = "Lin")

nir <- sen[[1]]
mean3 <- focal(nir, matrix(1/9, 3, 3), fun = mean)
plot(mean3)

sd3 <- focal(nir, matrix(1/9, 3, 3), fun = sd)

ggplot() +
  geom_raster(sd3, mapping = aes(x = x,
                                 y = y,
                                 fill = layer)) +
  ggtitle("Standard deviation moving window 3x3")

sd3_d <- as.data.frame(sd3, xy = T)

ggplot() +
  geom_raster(sd3_d, mapping = aes(x = x,
                                   y = y,
                                   fill = layer)) +
  ggtitle("Standard deviation moving window 3x3")


library(viridis)

# using viridis
ggplot() +
  geom_raster(sd3_d, mapping = aes(x = x,
                                   y = y,
                                   fill = layer)) +
  scale_fill_viridis() +
  ggtitle("Standard deviation moving window 3x3")

# cividis
p1 <- ggplot() +
  geom_raster(sd3_d, mapping = aes(x = x,
                                   y = y,
                                   fill = layer)) +
  scale_fill_viridis(option = "cividis") +
  ggtitle("Standard deviation moving window 3x3") 

# magma
p2 <- ggplot() +
  geom_raster(sd3_d, mapping = aes(x = x,
                                   y = y,
                                   fill = layer)) +
  scale_fill_viridis(option = "magma") +
  ggtitle("Standard deviation moving window 3x3")
  
p1 + p2
