ori_yes24 <- readLines("yes24.txt")

ori_yes24<-gsub("[^가-힣]", " ",ori_yes24)
ori_yes24<-gsub("\\s+", " ",ori_yes24)
word_data2 <- sapply(ori_yes24, extractNoun, USE.NAMES = F)

yes24 <- unlist(word_data2)
undata2 <- Filter(function(x) {nchar(x) <=4 & nchar(x) >= 2}, yes24)
word <- data.frame(sort(table(undata2),decreasing = T))

wordcloud2(word,rotateRatio = 1)
result <- wordcloud2(data = word)

library(htmlwidgets)
saveWidget(result,"tmpwc2.html",selfcontained = F)
