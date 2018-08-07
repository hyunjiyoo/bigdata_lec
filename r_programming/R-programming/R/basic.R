x <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
mean(x)  # x의 평균

# 작업경로 세팅
setwd("D:/Bigdata/Bigdata-R/bigdatar_pack")
getwd()

rm(x)  # x제거

###########################################################

a <- "홍길동"  # 스칼라 변수 생성
av <- c("홍길동","김철수","김영희","김순이")  # 이름 벡터 생성
bv <- c(23, 34, 45, 32)  # 나이 벡터 생성
cv <- c(3.4, 1.5, 4.2, 3.9)  # 벡터 학점 생성
dv <- c("서울","인천","수원","성남")  # 주소 벡터 생성

edf <- data.frame(av, bv, cv, dv)  # 데이터프레임 생성
names(edf) # 데이터프레임의 벡터 이름 가져오기
names(edf) <- c("이름", "나이", "학점", "주소")  # 데이터프레임 속 벡터이름 설정

edf$이름  # 이름만 보고싶을 때
edf$나이  # 나이만 보고싶을 때

edf$주소[2]  # edf 데이터프레임의 주소벡터에서 두번째값 가져올때
edf[2]  # edf 데이터프레임에서 두번째 값 = 두번째 벡터
edf[2,3]  # edf 에서 2행 3열
edf[ ,3]  # 모든 행을 보여주되, 3행만 보여줌.
edf[2, ]  # 2행이 보여주고, 열은 모두 보여줌.

###########################################################

iris
head(iris, 3) # iris 데이터에서 3번째까지만 보여줌.
names(iris)
str(iris)  # structure(str) 구성 보여줌.
summary(iris)  # iris 데이터 summary.

###########################################################

install.packages("psych")
install.packages("devtools")  # github 연동
library("psych")

describe(iris)  # psych 패키지안에 있는 describe() 함수로 iris 데이터 분석.


