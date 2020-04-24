rm(list = ls())
drv <- JDBC("oracle.jdbc.driver.OracleDriver","C:/Alpha/ojdbc6.jar")
conn <- dbConnect(drv,"jdbc:oracle:thin:@localhost:1521:xe","jdbctest","jdbctest")
# 객체 정보가 나오면 성공 한것이다.
conn

diris <- iris
names(diris) <- c('SLENGTH', 'SWIDTH', 'PLENGTH', 'PWIDTH', 'SPECIES')
dbWriteTable(conn,"IRIS", diris)

returniris <- dbReadTable(conn, "IRIS")

library(ggplot2)
png(filename="db1.png", height=400, width=700, bg="white")
ggplot(returniris, aes(SWIDTH, SLENGTH)) + geom_point(aes(group=SPECIES,colour=SPECIES))
dev.off()
png(filename="db2.png", height=400, width=700, bg="white")
ggplot(returniris, aes(PWIDTH, PLENGTH)) + geom_point(aes(group=SPECIES,colour=SPECIES))
dev.off()
