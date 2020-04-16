install.packages("ggplot2")
str(ggplot2::mpg)
mpg <- as.data.frame(ggplot2::mpg)

# 1-1 mpg의 구조를 확인한다.
str(mpg)
# 1-2 mpg 의 행의 개수와 열의 개수를 출력한다.
mpg %>% dim()
# 1-3 mpg의 데이터를 앞에서 10개 출력한다.
mpg %>% head(10)
# 1-4 mpg의 데이터를 뒤에서 10개 출력한다.
mpg %>% tail(10)
# 1-5. mpg의 데이터를 GUI 환경으로 출력한다.
View(mpg)
# 1-6 mpg를 열 단위로 요약한다.
summary(mpg)
# 1-7 mpg 데이터셋에서 제조사별 차량의 수를 출력한다.
mpg %>% group_by(manufacturer) %>% count(manufacturer)
# 1-8 mpg 데이터셋에서 제조사별 그리고 모델별 차량의 수를 출력한다.
mpg %>% group_by(manufacturer) %>% count(manufacturer)
mpg %>% group_by(class) %>% count(class)

# 2-1 

mpg <- mpg %>% rename(city = cty, highway = hwy)


str(ggplot2::midwest)
midwest <- as.data.frame(ggplot2::midwest)
midwest <- midwest %>% rename(total=poptotal,asian = popasian)
View(midwest)
midwest %>% mutate('전체 인구 대비 아시아 인구 백분율'=mean(asian)/mean(total)*100)
temp<-midwest %>% summarise(mean(asian))
midwest %>% mutate(test = ifelse(asian > temp, "large", "small"))

# 4-1
mpg <- as.data.frame(ggplot2::mpg)
mpg %>% filter(displ<=4) %>% summarise(mean(hwy))
mpg %>% filter(displ>=4) %>% summarise(mean(hwy))

#4-2
mpg %>% filter(manufacturer=='audi') %>% summarise(mean(cty))
mpg %>% filter(manufacturer=='toyota') %>% summarise(mean(cty))

# 4-3 
mpg %>% filter(manufacturer=='ford'|manufacturer=='honda'|manufacturer=='chevrolet') %>% summarise(mean(cty))


#5-1
newMpg <- mpg %>% select(class,cty)
newMpg %>% head(10)

newMpg %>% filter(class == 'suv')  %>% summarise(mean(cty))
newMpg %>% filter(class == 'compact')  %>% summarise(mean(cty))

#6
mpg %>% filter(manufacturer == 'audi') %>% arrange(desc(hwy)) %>% head(5)
