# R_code_multivariate_analysis.r

library(raster)
library(ggplot2)
library(viridis)

setwd("C:/lab/")

sen <- brick("sentinel.png")

sen
plot(sen)

# in order to group bands, we remove the last one
sen2 <- stack(sen[[1]], sen[[2]], sen[[3]])

plot(sen2)

# pair-wise comparison
pairs(sen2)

# PCA (Principal Component Analysis)
sample <- sampleRandom(sen2, 10000)
pca <- prcomp(sample)

# variance explained
summary(pca)

# the firts component is the one with the highest variability

# correlation with original bands
pca

# pc map: we visualize starting from the analysis of the pca
pci <- predict(sen2, pca, index=c(1:2))
plot(pci)
plot(pci[[1]])

# ggplot
pcid <- as.data.frame(pci[[1]], xy=T)

ggplot() +
  geom_raster(pcid, mapping = aes(x=x, y=y, fill=PC1)) +
  scale_fill_viridis()

#magma
ggplot() +
  geom_raster(pcid, mapping = aes(x=x, y=y, fill=PC1)) +
  scale_fill_viridis(option = "magma")

#Inferno 
ggplot() +
  geom_raster(pcid, mapping = aes(x=x, y=y, fill=PC1)) +
  scale_fill_viridis(option = "inferno")

# speeding up analyses
# aggregate cells: resampling (ricampionamento)
senres <- aggregate(sen, fact=10)

# then repeat the PCA analysis
