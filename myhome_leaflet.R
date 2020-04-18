multi_lonlat <- geocode(enc2utf8("곡선로 50번길 73"), source = "google")

mk <- multi_lonlat
lon <- mk$lon
lat <- mk$lat

msg <- '<b>우리집</b><hr>집 가고 싶당'
map <- leaflet() %>% setView(lng = mk$lon, lat = mk$lat, zoom = 17) %>% addTiles() %>% 
  addCircles(lng = lon, lat = lat, color='black', popup = msg )
map

library(htmlwidgets)
saveWidget(map, file="mymap.html")
