# Exercise: plot the NIR band
# b1 = blue
# b2 = green
# b3 = red
# b4 = NIR

palette <- colorRampPalette(c("pink", "violet", "darkorchid4")) (100)

plot(image_2011$B4_sre, col = new_palette)
plot(image_2011[[4]], col = palette) 

# dev.off()

# Function to export graphs
pdf("my_1st_graph.pdf")
plot(image_2011[[4]], col = palette) 
dev.off()

png("first.png")
plot(image_2011[[4]], col = palette) 
dev.off()


# Function to do a multiframe for graphs
# We want a multifram with 2 rows and 1 column
par(mfrow = c(2, 1))
plot(image_2011[[3]], col = palette) #red
plot(image_2011[[4]], col = palette) #NIR

dev.off()


# Let's plot all bands
par(mfrow = c(2, 2))

#blue
col_blue <- colorRampPalette(c("blue4", "blue2", "lightblue"))(100)
plot(image_2011[[1]], col = col_blue)

#green
col_green <- colorRampPalette(c("darkgreen", "green", "lightgreen"))(100)
plot(image_2011[[2]], col = col_green)

#aquamarine
col_aquamarine <- colorRampPalette(c("aquamarine4", "aquamarine2", "aquamarine"))(100)
plot(image_2011[[3]], col = col_aquamarine)

#pink
col_pink <- colorRampPalette(c("pink", "violet", "darkorchid4"))(100)
plot(image_2011[[4]], col = col_pink)

pdf("multiframe.pdf")
par(mfrow = c(2, 2))
plot(image_2011[[1]], col = col_blue)
plot(image_2011[[2]], col = col_green)
plot(image_2011[[3]], col = col_aquamarine)
plot(image_2011[[4]], col = col_pink)
dev.off()

dev.off()

png("image.png")
par(mfrow = c(2, 2))
plot(image_2011[[1]], col = col_blue)
plot(image_2011[[2]], col = col_green)
plot(image_2011[[3]], col = col_aquamarine)
plot(image_2011[[4]], col = col_pink)
dev.off()


#RGB plotting, plot of multi-layered raster object

# RGB scheme for colors
# Real colors image
# Blue = 1
# Green = 2
# Red = 3

?plotRGB
plotRGB(image_2011, r = 3, g = 2, b = 1, stretch = "Lin")  # linear stretch
plotRGB(image_2011, r = 4, g = 3, b = 2, stretch = "Lin") # vegetation is red
plotRGB(image_2011, r = 3, g = 4, b = 2, stretch = "Lin") # vegetation is green
# the fourth band is the NIR band, plants strongly reflect NIR

plotRGB(image_2011, r = 3, g = 2, b = 4, stretch = "Lin") # vegetation is blue
# deforestated soil is yellow

par(mfrow = c(2, 1))
plotRGB(image_2011, r = 3, g = 2, b = 1, stretch = "Lin")  # natural colors
plotRGB(image_2011, r = 4, g = 3, b = 2, stretch = "Lin")

dev.off()

# Histogram stretching
par(mfrow = c(2, 1))
plotRGB(image_2011, r = 3, g = 2, b = 1, stretch = "Hist")  # natural colors
plotRGB(image_2011, r = 4, g = 3, b = 2, stretch = "Hist")


# Mixed stretching, differences between the 2 types of stretch
plotRGB(image_2011, r = 4, g = 3, b = 2, stretch = "Lin")
plotRGB(image_2011, r = 4, g = 3, b = 2, stretch = "Hist")
