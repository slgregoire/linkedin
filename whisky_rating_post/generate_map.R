library(ggmap)
library(reshape2)

top_whiskies = read.csv('top_whiskies.csv')
adjLong = top_whiskies$FinalLong
adjLong = adjLong + .3
adjLong[4] = adjLong[4] - .6
top_whiskies$adjLong = adjLong

whiskyMap =  qmap(location = "Scotland", zoom = 6, maptype = "watercolor")
whiskyMap + geom_point(data = top_whiskies, size=3.5, color='black', mapping=aes(x = FinalLat, y = FinalLong)) +
  geom_text(data = top_whiskies, color='black', size=5, mapping=aes(x = FinalLat, y = adjLong, label = Distillery))   
