#library(maptools)
#library(rgdal)

#whiskies = read.csv('whiskies.txt')
#whiskies.coord = data.frame(whiskies$Latitude, whiskies$Longitude) 
#coordinates(whiskies.coord) = ~whiskies.Latitude + whiskies.Longitude
#proj4string(whiskies.coord) = CRS("+init=epsg:27700")  # Specify that our coords are in osgb grid coord
#whiskies.coord = spTransform(whiskies.coord, CRS("+init=epsg:4326"))  # spTransform to convert osgb grid to lat/lon
#whiskies.coord.df = data.frame(whiskies.coord)
#whiskies = cbind(whiskies, whiskies.coord.df)
#write.csv(whiskies, file='whiskies_w_coords.csv')

library(ggmap)
library(rjson)

top_whiskies = read.csv('top_whiskies.csv')
whiskyMap =  qmap(location = "Scotland", zoom = 6, maptype = "terrain")
whiskyMap + geom_point(data = top_whiskies, aes(x = FinalLat, y = FinalLong)) 