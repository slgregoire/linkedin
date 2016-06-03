library(ggmap)
library(reshape2)

top_scotches = read.csv('top_scotches_map.csv')

adjLong = top_scotches$FinalLong
adjLong = adjLong + .3
adjLong[4] = adjLong[4] - .6
top_scotches$adjLong = adjLong

adjLat = top_scotches$FinalLat
adjLat[5] = adjLat[5] + .5
top_scotches$adjLat = adjLat

whiskyMap =  qmap(location = "Scotland", zoom = 6, maptype = "watercolor")
whiskyMap + geom_point(data = top_scotches, size=3.5, color='black', mapping=aes(x = FinalLat, y = FinalLong)) +
  geom_text(data = top_scotches, color='black', size=5, mapping=aes(x = adjLat, y = adjLong, label = Distillery))   
