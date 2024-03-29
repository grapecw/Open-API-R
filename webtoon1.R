library(RSelenium)
remDr<-remoteDriver(remoteServerAddr= "localhost" ,
                    port = 4445, browserName= "chrome")
remDr$open()
url <- "http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135"
remDr$navigate(url)

output = NULL
for (i in 2:54) {
  if(i==2) {
    j=i;
  } else if(i==3) {
    more <- remDr$findElements(using='css selector',
                               'div.u_cbox_sort div.u_cbox_sort_option div ul li:nth-child(2) a')
    j=j+1;
  } else if(j==13) {
    more <- remDr$findElements(using='css selector',
                               paste0('#cbox_module > div > div.u_cbox_paginate > div > a:nth-child(',j,')'))
    j = j-9;
  }
  else {
    more <- remDr$findElements(using='css selector',
                               paste0('#cbox_module > div > div.u_cbox_paginate > div > a:nth-child(',j,')'))
    j=j+1;
  }
  if(i>2) {
    sapply(more,function(x){x$clickElement()})
  }
  Sys.sleep(1)
  doms <- remDr$findElements(using ="css selector",
                             "div.u_cbox_text_wrap span.u_cbox_contents")
  temp <- sapply(doms,function(x){x$getElementText()})
  unlist(temp)
  output <- c(output,unlist(temp))
}

output

write.table(
  output,
  file="webtoon1.txt",
  row.names = FALSE
)

