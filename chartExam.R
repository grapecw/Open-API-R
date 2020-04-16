mylog = read.table("data/product_click.log",sep=" ")

# 문제1
mylogcount = table(mylog[2])
barplot(mylogcount, col = terrain.colors(10))
title(main="세로바 그래프 실습") 
dev.copy(png, "clicklog1.png")
dev.off()

#문제2
myclicklog = table(substr(mylog$V1,9,10))
pie(myclicklog, labels=paste(names(myclicklog) , "-", as.numeric(names(myclicklog))+1 ), col = cm.colors(5))
title(main="파이그래프 실습")
dev.copy(png, "clicklog2.png")
dev.off()

