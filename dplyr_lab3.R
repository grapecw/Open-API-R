mpg <- as.data.frame(ggplot2::mpg)
View(mpg)

#7-1
copyMpg <- mpg %>% mutate(totaly = hwy + cty)

#7-2
copyMpg <- copyMpg %>% mutate(meany = totaly/2)

#7-3
copyMpg %>% arrange(desc(meany)) %>% head(3)

# 7-4
mpg %>% mutate(totaly = hwy + cty) %>% 
      mutate(meany = totaly/2) %>% 
      arrange(desc(meany)) %>% 
      head(3)

# 8-1
mpg %>% group_by(class) %>% 
  summarise(mean(cty))

# 8-2
mpg %>% group_by(class) %>% 
  summarise(meancty=mean(cty)) %>% 
  arrange(desc(meancty))


# 8-3
mpg %>% group_by(manufacturer) %>% 
  summarise(meanhwy=mean(hwy, na.rm = T)) %>% 
  arrange(desc(meanhwy)) %>% 
  head(3)

#8-4
mpg %>% filter(class=='compact') %>% 
  group_by(manufacturer) %>% 
  count(class) %>% 
  arrange(desc(n))

#9-1
fuel <- data.frame(fl = c("c","d","e","p","r"),
                   price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22),
                   stringsAsFactors = F)

fuel
mpg<-full_join(mpg, fuel, by = "fl")

mpg %>% select(model, fl, price_fl)

# 10-1
midwest <- as.data.frame(ggplot2::midwest)
View(midwest)
midwest <- midwest %>% mutate(kid = (poptotal-popadults)/poptotal * 100)
# 10 -2
midwest %>% select(PID,county,kid) %>% arrange(desc(kid)) %>% head(5)
# 10-3
midwest <- midwest %>%
  mutate(kidscale = ifelse(kid >= 40, "large", 
                       ifelse(kid >= 30, "middel", "samll")))
# 10-4
midwest %>% group_by(kidscale) %>% count(kidscale)

# 11-1
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65,124,131,153,212), "hwy"] <- NA

table(mpg$drv)
table(mpg$hwy)

mpg %>% filter(!is.na(hwy)) %>% group_by(drv) %>% summarise(mean(hwy))

#12 -1 
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(10,14,58,93),"drv"] <- "k"
mpg[c(29,43,129,203),"cty"] <- c(3,4,39,42)

table(mpg$drv)
mpg$drv <- ifelse(mpg$drv == "k", "%in%", mpg$drv)
table(mpg$drv)

boxplot(mpg$cty)
summary(mpg$cty)
mpg$cty <- ifelse(mpg$cty > 25.5 | mpg$cty <11 , NA, mpg$cty)
boxplot(mpg$cty)

mpg %>% filter(drv != "%in%") %>% group_by(drv) %>% filter(!is.na(cty)) %>% summarise(mean(cty))
