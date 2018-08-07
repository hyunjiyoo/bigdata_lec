# 깃헙 개발자플랫폼 설치
install.packages("devtools")
library(devtools)
# javascript로 만든 역동성있는 그래프패키지
install.packages("d3Network")
library(d3Network)

install.packages("RCurl")
library(RCurl)

install.packages("networkD3")
library(networkD3)

#############################################################################################

# 서로 매칭이 되어, 누구를 건너면 누구를 알 수 있는지 알 수 있다.
Source <- c("정우성","정우성","정우성","정우성","김태희","김태희","장동건","장동건","고소영")
Target <- c("김태희","장동건","고소영","하정우","김향기","이정재","원빈","박서준","박민영")

# NetworkData에 source, target 데이터를 dataframe으로 만들어라.
NetworkData <- data.frame(Source,Target)
# d3SimpleNetwork함수에 networkdata 데이터프레임을 담아 저 크기로 파일을 만들어라.
d3SimpleNetwork(NetworkData, width=1000, height=550, file="test1.html")
# 색상 지정하고, 투명도 설정하여 test2.html 파일 만들어라.
d3SimpleNetwork(NetworkData, width = 400, height = 250,textColour = "orange", linkColour = "red", nodeColour = "orange", opacity = 0.9,file="test2.html")

simpleNetwork(NetworkData, zoom = T)

