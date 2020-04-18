multi_lonlat <- geocode(enc2utf8("곡선로 50번길 73"), source = "google")
mk <- multi_lonlat
cen <- c(mk$lon, mk$lat)

timestep <- format(Sys.time(),format = "%S")


png(filename="mymap.png", height=400, width=700, bg="white")
map <- get_googlemap(center=cen, maptype=ifelse(timestep<15, "terrain", 
                                                ifelse(timestep<30, "satellite",
                                                       ifelse(timestep, "roadmap", "hybrid"))),zoom=18, marker=mk)

ggmap(map)
dev.off()
