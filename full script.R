library(tidyverse)
library(leaflet)
library(leafem)
library(mapview)
library(sf)

# reading in data and ensuring the CRS for each
`Category 1` <- st_read(dsn = "E:\\QGIS\\Projects\\Norfolk\\Data\\Storm Surges\\Category 1", layer = "Environmental")
`Category 1` <- st_transform(`Category 1`, crs = "+init=epsg:4326")

`Category 2` <- st_read(dsn = "E:\\QGIS\\Projects\\Norfolk\\Data\\Storm Surges\\Category 2", layer = "Environmental")
`Category 2` <- st_transform(`Category 2`, crs = "+init=epsg:4326")

`Category 3` <- st_read(dsn = "E:\\QGIS\\Projects\\Norfolk\\Data\\Storm Surges\\Category 3", layer = "Environmental")
`Category 3` <- st_transform(`Category 3`, crs = "+init=epsg:4326")

`Category 4` <- st_read(dsn = "E:\\QGIS\\Projects\\Norfolk\\Data\\Storm Surges\\Category 4", layer = "Environmental")
`Category 4` <- st_transform(`Category 4`, crs = "+init=epsg:4326")

# setting the base mapview called m1
m1 <-mapview(`Category 4`,col.region = "gray", popup = NULL, 
             label = FALSE, homebutton = FALSE, alpha.regions=.6)+
  mapview(`Category 3`,col.region = "yellow", popup = NULL, 
          label = FALSE, homebutton = FALSE, alpha.regions=.4)+
  mapview(`Category 2`,col.region = "green", popup = NULL, 
          label = FALSE, homebutton = FALSE, alpha.regions=.5)+
  mapview(`Category 1`,col.region = "blue", popup = NULL, 
          label = FALSE, homebutton = FALSE, alpha.regions=.6)
  
# creating a dataframe of long/lats for nearby points

places <- c("Naval Station Norfolk")
lon <- c(-76.296478)
lat <- c(36.936858)

`Naval Station Norfolk` <-data.frame(places, lat, lon)
`Naval Station Norfolk` <- st_as_sf(points, coords = c("lon", "lat"), crs = 4326)

img <- "https://upload.wikimedia.org/wikipedia/commons/d/d2/Naval_Station_Norfolk.jpg"

# Adding point

m1+mapview(`Naval Station Norfolk`, label = FALSE, popup = popupImage(img, src = "remote"), col.region = "black")





