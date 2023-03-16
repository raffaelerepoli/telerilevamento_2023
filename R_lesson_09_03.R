# Firts lesson of Remote Sensing in GitHub

# Let's install the raster package
library(raster)

# Import data and setting the working directory
setwd("C:/lab")

image_2011 <- brick("p224r63_2011_masked.grd")
image_2011

# Beware of the size of plots pane, if it's too small it won't work

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

# Change of palette
new_palette <- colorRampPalette(c("aquamarine", "cadetblue", "cyan")) (100)
plot(image_2011, col = new_palette)

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








