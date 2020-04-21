library(dplyr)
pdf <- read.table("C:/Alpha/Rstudy/data/product_click.log")
names(pdf) <- c("logdate", "product")
pdf <- pdf %>% select(product) %>% group_by(product) %>% summarise(clickcount = n()) %>% arrange(desc(clickcount)) %>% head(1)
pdf <- as.data.frame(pdf)
pdf

library(KoNLP)

y <- readLines("data/hotel.txt")
y<-gsub("[^가-힣]", " ",y)
y2 <- sapply(y, extractNoun, USE.NAMES = F)
y2 <- gsub("[::space::]+", " ",y)
y3<- extractNoun(y2)
y3 <- Filter(function(x) {nchar(x) >= 2}, y3)
yTable <- table(unlist(y3))
yTable <- sort(yTable, decreasing = T)
result = head(yTable, 10)

