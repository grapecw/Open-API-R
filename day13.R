install.packages("KoNLP")
# 패키지 설치가 잘 됩니까요?ㅜㅜ
# 2020.04.16 현재 안됩니다요...ㅜㅜ
# 강사컴의 KoNLP.zip을 복사해서 사용합니다.
# KoNLP.zip의 압축을 해제하고 생성된 KoNLP폴더를
# C:\Users\student\Documents\R\win-library\3.6 에
# 복사합니다.
# 그리고 나서 다음에 제시된 패키지들을 하나하나
# 설치합니다.
install.packages("Sejong")
install.packages("hash")
install.packages("rJava")
install.packages("tau")
install.packages("RSQLite")
install.packages("devtools")
install.packages("Rcpp")
# KoNLP 로드
library(KoNLP)

# 한번 수행하면 더 이상 수행할 필요가 없어용(오래 걸려)
useSystemDic()
useSejongDic()
useNIADic()

word_data <- readLines("book/애국가(가사).txt")
word_data

word_data2 <- sapply(word_data, extractNoun, USE.NAMES = F)
word_data2
word_data3 <- extractNoun(word_data)
word_data3

add_words <- c("백두산", "남산", "철갑", "가을", "달")
buildDictionary(user_dic=data.frame(add_words, rep("ncn", length(add_words))), replace_usr_dic=T)

word_data3 <- extractNoun(word_data)
word_data3

undata <- unlist(word_data3)
undata

word_table <- table(undata)
word_table

undata2 <- Filter(function(x) {nchar(x) >= 2}, undata)
word_table2 <- table(undata2)
word_table2

final <- sort(word_table2, decreasing = T)

head(final, 10)

extractNoun("대한민국의 영토는 한반도와 그 부속도서로 한다")
SimplePos22("대한민국의 영토는 한반도와 그 부속도서로 한다")
SimplePos09("대한민국의 영토는 한반도와 그 부속도서로 한다")



# 워드 클라우드


install.packages("wordcloud")
library(wordcloud)
install.packages("wordcloud2")
library(wordcloud2)

# stringsAsFactors로 캐릭터 벡터로 처리하도록 했다.
(words <- read.csv("data/wc.csv",stringsAsFactors = F))
head(words)
# 원하는 폰트 패밀리를 지정하는 역활
?windowsFonts
# 휴먼 옛체
# 호출 결과를 휴먼 옛체를 lett이라는 이름으로 으로 저장이 된다.
windowsFonts(lett=windowsFont("휴먼옛체"))
# 원소 단위로 1:1매핑시킨다.
# 값이 클수록 글씨가 크게 나오고, 작을 수록 작게 나온다.
wordcloud(words$keyword, words$freq, family="lett")
# 폰트를 지정 안해서 고딕체로 나옴
wordcloud(words$keyword, words$freq, 
          # 최소 갯수가 2개 이상인것만 출력하겠다.
          min.freq = 2, 
          random.order = FALSE, 
          # 출력되는 폰트의 크기, 4부터 시작해서 1씩 줄여나가겠다.
          rot.per = 0.3, scale = c(4, 1), 
          # 색을 지정하는 부분
          colors = rainbow(7))

# 동적인 그림을 그린다.
# 빗자루 옆에 하면 브라우저로 켜짐
# 글자 위에 올리면 할 수 있다.
# 자바 스크립트로 클릭 이벤트 지정도 가능
wordcloud2(words, fontFamily = "휴먼옛체")
# rotateRatio = 1 : 100 프로 다 회전 시켜라. 얼마나 회선할지는 무작위
wordcloud2(words,rotateRatio = 1)
wordcloud2(words,rotateRatio = 0.5)
# 글자 크기 세세하게 지정 불가. 글자 크기는 1
wordcloud2(words,rotateRatio = 0)
wordcloud2(words,size=0.5,col="random-dark")
wordcloud2(words,size=0.5,col="random-dark", figPath="book/peace.png")
# 백 그라운드 색을 지정
wordcloud2(words,size=0.7,col="random-light",backgroundColor = "black")
View(demoFreq)
# demoFreq 데이터 빈도수를 알려준다다
wordcloud2(data = demoFreq)
wordcloud2(data = demoFreq, shape = 'diamond')
wordcloud2(data = demoFreq, shape = 'star')
wordcloud2(data = demoFreq, shape = 'cardioid')
wordcloud2(data = demoFreq, shape = 'triangle-forward')
wordcloud2(data = demoFreq, shape = 'triangle')
result<-wordcloud2(data = demoFreq, shape = 'pentagon')
# 결과를 HTML을 만들어 내는 모든 명령의 도움을 주는 패키지
library(htmlwidgets)
# selfcontained는 다이나믹한 웹 페이지를 만들기 위해 필요한 모든 것을 저장해 줄까 라는 명령어어
saveWidget(result,"tmpwc.html",selfcontained = F)
head(demoFreq)
str(demoFreq)

# 트위터 글 워드클라우드
library(rtweet) 
appname <- "edu_data_collection"
api_key <- "RvnZeIl8ra88reu8fm23m0bST"
api_secret <- "wTRylK94GK2KmhZUnqXonDaIszwAsS6VPvpSsIo6EX5GQLtzQo"
access_token <- "959614462004117506-dkWyZaO8Bz3ZXh73rspWfc1sQz0EnDU"
access_token_secret <- "rxDWfg7uz1yXMTDwijz0x90yWhDAnmOM15R6IgC8kmtTe"
twitter_token <- create_token(
  app = appname,
  consumer_key = api_key,
  consumer_secret = api_secret,
  access_token = access_token,
  access_secret = access_token_secret)

key <- "취업"
key <- enc2utf8(key)
result <- search_tweets(key, n=100, token = twitter_token)
str(result)
content <- result$retweet_text
content <- gsub("[[:lower:][:upper:][:digit:][:punct:][:cntrl:]]", "", content)   

word <- extractNoun(content)
cdata <- unlist(word)
cdata

cdata <- Filter(function(x) {nchar(x) < 6 & nchar(x) >= 2} ,cdata)
wordcount <- table(cdata) 
wordcount <- head(sort(wordcount, decreasing=T),30)

par(mar=c(1,1,1,1))
wordcloud(names(wordcount),freq=wordcount,scale=c(3,0.5),rot.per=0.35,min.freq=1,
          random.order=F,random.color=T,colors=rainbow(20))

