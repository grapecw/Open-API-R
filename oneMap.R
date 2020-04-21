DONG<-read.csv('data/one.csv')
# View(DONG)
Encoding(names(korpopmap2))<-'UTF-8'
Encoding(korpopmap2@data$name)<-'UTF-8'
Encoding(korpopmap2@data$행정구역별_읍면동)<-'UTF-8'
Encoding(names(korpopmap3))<-'UTF-8'

Encoding(korpopmap3@data$name)<-'UTF-8'
Encoding(korpopmap3@data$행정구역별_읍면동)<-'UTF-8'
head(korpopmap3@data)

k2 <- korpopmap2
k3 <- korpopmap3

guname <- '종로구'
gucode <- k2@data[k2@data$name == guname, "code.data"]
pattern <- paste0('^', gucode)


k3@data <-k3@data[grep(pattern, k3@data$code.data),]
k3@polygons <-k3@polygons[grep(pattern, k3@data$code.data)]

colnames(DONG)<-c('구별','name','일인가구')
dong <- DONG %>%filter(구별==guname)

k3@data<-merge(k3@data,dong,by.x='name',sort=FALSE)
mymap <- k3@data

mypalette <- colorNumeric(palette ='Set3' , domain = k3@data$'일인가구')
mypopup <- paste0(mymap$name,'<br> 1인가구: ',k3@data$'일인가구')

map7 <- NULL
map7<-leaflet(k3) %>% 
  addTiles() %>% 
  setView(lat=37.52711, lng=126.987517, zoom=12) %>%
  addPolygons(stroke =FALSE,
              fillOpacity = .7,
              popup = mypopup,
              color = ~mypalette(k3@data$일인가구)) %>% 
  addLegend( values = ~k3@data$일인가구,
             pal = mypalette ,
             title = '인구수',
             opacity = 1)
map7		

saveWidget(map7, file="oneMap.html")
