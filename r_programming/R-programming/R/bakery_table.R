bakery <- read.csv("R/example_bakery.csv")
bakery
head(bakery)
str(bakery)
bakery$snack <- bakery$cake + bakery$pie + bakery$cookie  # bakery에 snack 변수 생성.
bakery$beverage <- bakery$smoothie + bakery$coffee

#####################################################################################

install.packages("lubridate")
library(lubridate)

#####################################################################################

bakery$year <- year(bakery$date)  # date에서 년도 추출해서 year변수에 저장.
bakery$month <- month(bakery$date)  # date에서 월 추출해서 month변수에 저장.
bakery$day <- day(bakery$date)  # date에서 일 추출해서 day변수에 저장.
bakery$weekday <- wday(bakery$date, label = TRUE)  # label을 넣으면 월화수로 나옴.


# weekday변수와 weekends변수 생성
weekday <- c("월", "화", "수", "목", "금", "토", "일")
weekends <- c("평일", "평일", "평일", "평일", "평일", "주말", "주말")

wend <- data.frame(weekday, weekends)  # wend라는 테이블 생성.

# merge(x-table1, y-table2, 기준, 결합기준(x-table에서 중복허용))
bakery2 <- merge(bakery, wend, by = "weekday", all.x = T)
bakery2

#####################################################################################

hist(bakery2$cookie)
hist(bakery2$cookie,breaks=30, col="skyblue")  # break는 구간을 얼마나 쪼갤지 정하는 수.
hist(bakery2$cookie,breaks=5,prob=T)


boxplot(bakery2$cookie)
plot(bakery2$cookie)
table(bakery2$promotion)  # 각 변수의 빈도수 계산 = table()

#####################################################################################

install.packages("Rcmdr")
library(Rcmdr)

#####################################################################################

stackloss <- read.csv("R/stackloss.csv")
stackloss
