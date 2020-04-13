# 날짜와 시간 관련 기능을 지원하는 함수들

Sys.Date()
Sys.time()

class(Sys.Date())
#"POSIXct"년월일을 나타내는 객체
class(Sys.time())

# 날짜 출력 형식들 3번째 빼고 다됨
as.Date("2020-04-15")
as.Date("2020/04/15")
as.Date("2020,04,15")
as.Date("15-04-2020")

# 날짜 포멧을 지정하는 방법이다.
as.Date("2020,04,15", format="%Y,%m,%d")
as.Date("15-04-2020", format="%d-%m-%Y")

(today <- Sys.Date())
# 세기까지 표현하고 싶다면 대문자 Y
# 대문자 B는 아예 4월 등으로 명시
# 대문자 A는 월요일 등의 방식으로 병시
format(today, "%Y년 %m월 %d일%")
format(today, "%d일 %B %Y년")
format(today, "%y")
format(today, "%Y")
format(today, "%B")
format(today, "%a")
format(today, "%A")
weekdays(today) 
months(today) 
# 분기를 표현해 준다
quarters(today)
unclass(today)  # 1970-01-01을 기준으로 얼마나 날짜(일)가 지났지는 지의 값을 가지고 있다.
Sys.Date()
# 시간까지 표현해준다
Sys.time()
# 어느 나라 시간인지
Sys.timezone()

# 포멧을 지정해서 해줄 수도 있다.
as.Date('1/15/2018',format='%m/%d/%Y') # format 은 생략 가능
as.Date('4월 26, 2018',format='%B %d, %Y')
# 아예 이런식으로 포멧을 지정해서 할 수도 있다
as.Date('110228',format='%d%b%y') 

Sys.setlocale("LC_TIME", "English")
Sys.setlocale()

x1 <- "2019-01-10 13:30:41"
# 문자열을 날짜형으로 -> 시분초 무시
as.Date(x1, "%Y-%m-%d %H:%M:%S") 
# 문자열을 날짜+시간형으로
strptime(x1, "%Y-%m-%d %H:%M:%S") # format 문자열 지정은 필수
strptime('2019-08-21 14:10:30', "%Y-%m-%d %H:%M:%S")

start <- as.Date("2020-01-01")
end <- as.Date("2021-01-01")
# 매일매일을 출력한다.
seq(start, end, 1)
seq(start, end, "day")
# 주 단위로 증가한다.
seq(start, end, "week")
# 월 단위로 증가한다.
seq(start, end, "month")
# 연 단위로 증가한다.
seq(start, end, "year")
# 3달 단위로 증가한다.
seq(start, end, "3 month")
# 구간 내의 기간을 7개로 나눈다.
seq(start, end, length.out=7)


x2 <- "20200601"
as.Date(x2, "%Y%m%d")
datetime<-strptime(x2, "%Y%m%d")
# POSIXlt 객체로 변환해 주는 객체
str(datetime)

# Date 객체는 날짜만 나타낼 수 있으며 시간처리 불가
# 날짜와 시간을 함께 처리하려면 POSIXct 또는 POSIXlt 타입의 객체 사용

pct <- as.POSIXct("2020/04/15 11:30:20")
plt <- as.POSIXlt("2020/04/15 11:30:20")
pct
plt
# 클래스로 어떤 형식인지 보여줌
class(pct)
class(plt)
# 기준 시간을 기준으로 초 시간 ->POSIXct객체는 즉, 숫자를 저장한다.
as.integer(pct)
# 년월신 시분 객체를 기준으로 리스트 객체를 넣는다. 즉 numerric 객체를 저장한다.
as.integer(plt)
# 객체 상태를 해제해서 내용을 보면 리스트형태로 저장되 있는걸 확인 가능하다
unclass(plt)
plt$sec
plt$min
plt$hour
plt$mday
plt$mon # 0 - 1월
plt$year
plt$wday # 0-일요일



t<-Sys.time()
ct<-as.POSIXct(t)
lt<-as.POSIXlt(t)
str(ct) 
str(lt) 
unclass(ct) 
unclass(lt) 
lt$mon+1
lt$hour
lt$year+1900
as.POSIXct(1449994438,origin="1970-01-01")
as.POSIXlt(1449994438,origin="1970-01-01")


#올해의 크리스마스 요일 2가지방법(요일명,숫자)
christmas2<-as.POSIXlt("2020-12-25")
weekdays(christmas2)
christmas2$wday
#2020년 1월 1일 어떤 요일
tmp<-as.POSIXct("2020-01-01")
weekdays(tmp)
#오늘은 xxxx년x월xx일x요일입니다 형식으로 출력
tmp<-Sys.Date()
# ---- 형식으로 출력하는 2가지 방법법
format(tmp,'오늘은 %Y년 %B %d일 %A입니다')
year<-format(tmp,'%Y')
month<-format(tmp,'%m')
day<-format(tmp,'%d')
weekday<-format(tmp,'%A')
paste("오늘은 ",year,"년 ",month,"월 ",day,"일 ",weekday," 입니다.",sep="")

as.Date("2020/01/01 08:00:00") - as.Date("2020/01/01 05:00:00")
as.POSIXct("2020/01/01 08:00:00") - as.POSIXct("2020/01/01 05:00:00")
as.POSIXlt("2020/01/01 08:00:00") - as.POSIXlt("2020/01/01 05:00:00")


# 문자열 처리 관련 주요 함수들

x <- "We have a dream"
# 문자 하나하나의 객채 " "포함
nchar(x)
# 몇개의 객체인지 세는 것
length(x)

y <- c("We", "have", "a", "dream")
# 객체의 갯수 4
length(y)
# 각각 객체의 글자수를 센다.
nchar(y)

letters
sort(letters, decreasing=TRUE)

fox.says <- "It is only with the HEART that one can See Rightly"
# 전부 대분자, 전부 소분자
tolower(fox.says)
toupper(fox.says)

substr("Data Analytics", start=1, stop=4)
substr("Data Analytics", 6, 14)
# substring -> 시작 위치만 주면 무조건 끝까지 뽑는다.
substring("Data Analytics", 6)

classname <- c("Data Analytics", "Data Mining", "Data Visualization")
substr(classname, 1, 4)

countries <- c("Korea, KR", "United States, US", "China, CN")
substr(countries, nchar(countries)-1, nchar(countries))

# 대륙명들을 출력한다. R 내장 함수
head(islands)
# 항목 네임만 출력한다.
landmesses <- names(islands)
landmesses
# pattern 은 정규 표현식도 쓸 수 있다는 표현현
grep(pattern="New", x=landmesses)

index <- grep("New", landmesses)
landmesses[index]
# 동일
grep("New", landmesses, value=T)


txt <- "Data Analytics is useful. Data Analytics is also interesting."
sub(pattern="Data", replacement="Business", x=txt)
gsub(pattern="Data", replacement="Business", x=txt)

x <- c("test1.csv", "test2.csv", "test3.csv", "test4.csv")
gsub(".csv", "", x)

words <- c("ct", "at", "bat", "chick", "chae", "cat", "cheanomeles", "chase", "chasse", "mychasse", "cheap", "check", "cheese", "hat", "mycat")

grep("che", words, value=T)
grep("at", words, value=T)
grep("[ch]", words, value=T)
grep("[at]", words, value=T)
grep("ch|at", words, value=T)
# check 나 chick가 있으면 그 둘만 출력해라
grep("ch(e|i)ck", words, value=T)
grep("chase", words, value=T)
grep("chas?e", words, value=T)
grep("chas*e", words, value=T)
grep("chas+e", words, value=T)
grep("ch(a*|e*)se", words, value=T)
# c로 시작하는 걸 찾겠다.
grep("^c", words, value=T)
# t로 끝나는걸 찾겠다
grep("t$", words, value=T)
# c로 시작해야하고 t로 끝나야 한다. 그리고 * 그 사이에 몇개가 있던 상관 없음음
grep("^c.*t$", words, value=T)

words2 <- c("12 Dec", "OK", "http//", 
            "<TITLE>Time?</TITLE>", 
            "12345", "Hi there")

grep("[[:alnum:]]", words2, value=TRUE)
grep("[[:alpha:]]", words2, value=TRUE)
grep("[[:digit:]]", words2, value=TRUE)
grep("[[:punct:]]", words2, value=TRUE)
grep("[[:space:]]", words2, value=TRUE)
grep("\\w", words2, value=TRUE)
grep("\\d", words2, value=TRUE)
grep("\\s", words2, value=TRUE)



fox.said <- "What is essential is invisible to the eye"
fox.said
# " "를 기준으로 나뉜다. 리스트 셋으로 리턴한다.
strsplit(x= fox.said, split= " ")
# 문자마다 분리한다
strsplit(x= fox.said, split="")

fox.said.words <- unlist(strsplit(fox.said, " "))
fox.said.words
# 겹 대괄호를 썼으므로 unlist를 쓰지 않아도 좋다.
fox.said.words <- strsplit(fox.said, " ")[[1]]
fox.said.words
fox.said.words[3]
p1 <- "You come at four in the afternoon, than at there I shall begin to the  happy"
p2 <- "One runs the risk of weeping a little, if one lets himself be tamed"
p3 <- "What makes the desert beautiful is that somewhere it hides a well"
littleprince <- c(p1, p2, p3)
strsplit(littleprince, " ")
strsplit(littleprince, " ")[[3]] 
strsplit(littleprince, " ")[[3]][5]
