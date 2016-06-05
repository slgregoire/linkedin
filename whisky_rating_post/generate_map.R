library(ggmap)
library(reshape2)

top_scotches = read.csv('top_scotches_map.csv')

adjLong = top_scotches$FinalLong
#Bowmore
adjLong[1] = adjLong[1] - .3
#Bruichladdich
adjLong[2] = adjLong[2] + .3
#Dalmore
adjLong[3] = adjLong[3] + .3
top_scotches$adjLong = adjLong

adjLat = top_scotches$FinalLat
#Old Fettercairn
adjLat[4] = adjLat[4] + 1.75
#Old Pulteney
adjLat[5] = adjLat[5] + 1.45
#Royal Brackla
adjLat[6] = adjLat[6] + 1.7
#Scapa
adjLat[7] = adjLat[7] + .95
top_scotches$adjLat = adjLat

 
whiskyMap =  qmap(location = "Scotland", zoom = 6, maptype = "watercolor") + geom_point(data = top_scotches, size=3.5, color='black', mapping=aes(x = FinalLat, y = FinalLong)) +
 geom_text(data = top_scotches, color='black', size=5, mapping=aes(x = adjLat, y = adjLong, label = Distillery))   
print(whiskyMap)