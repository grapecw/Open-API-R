library(KoNLP)
word_data <- readLines("data/공구.txt",encoding = "UTF-8")
word_data<-gsub("[^가-힣]", " ",word_data)
word_data<-gsub("\\s", " ",word_data)
word_data<-gsub(" +", " ",word_data)
word_data2 <- sapply(word_data, extractNoun, USE.NAMES = F)
word_data2

unlistdata<-unlist(word_data2)
unlistdata <- Filter(function(x) {nchar(x) >= 2}, unlistdata)
word_table <- table(unlistdata)
word <- data.frame(sort(word_table,decreasing = T)[c(-1,-2)])

png(filename="wc.png", height=400, width=700, bg="white")
windowsFonts(lett=windowsFont("휴먼옛체"))
wordcloud(word$unlistdata, word$Freq, family="lett",
          min.freq = 2, 
          random.order = FALSE, 
          rot.per = 0.3, scale = c(5, 0.5), 
          color = gray.colors(10))

dev.off()
