## google비즈라는 패키지
install.packages("googleVis")
library(googleVis)

# 해당시간에 따라 몇명이 나갔고 들어왔는지 보여주는 데이터.
loc <- read.csv("R/14subway.csv",header=T)
head(loc)

# gvisMotionChart() 함수로 시각화 그래프 그려보기.
t1 <- gvisMotionChart(loc, idvar="line_no", timevar="time", 
                      options=list(width=1000,height=500))
plot(t1)

