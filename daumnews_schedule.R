url <- "https://media.daum.net/ranking/popular/"
library(rvest)
newsTitle <- NULL
newsCom <- NULL

text<- NULL
text <- read_html(url)
text

for( i in 1:5) {
  
  newsTitleNode <- html_nodes(text,paste0("#mArticle > div.rank_news > ul.list_news2 > li:nth-child(",i,") > div.cont_thumb > strong > a"))
  newsTitleTemp <- html_text(newsTitleNode, trim=TRUE)

  newsComNode <- html_nodes(text, paste0("#mArticle > div.rank_news > ul.list_news2 > li:nth-child(",i,") > div.cont_thumb > strong > span"))
  newsComTemp <- html_text(newsComNode, trim=TRUE)
  
  newsTitle <- c(newsTitle,newsTitleTemp)
  newsCom <- c(newsCom,newsComTemp)
}

newsDf<- data.frame(newsTitle, newsCom)
newsDf

temp <- source('C:/Alpha/Rstudy/daumnews_schedule.R', encoding="utf-8")
write.csv(temp$value,"temp.txt")