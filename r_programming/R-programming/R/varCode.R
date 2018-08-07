bakery2$season <- ifelse(bakery2$month < 3, "겨울",
                         ifelse(bakery2$month >=3 & bakery2$month < 6, "봄",
                                ifelse(bakery2$month >= 6 & bakery2$month < 9, "여름",
                                       ifelse(bakery2$month >=9 & bakery2$month < 12, "가을",
                                              "겨울"))))


par(mfrow=c(2,3))
plot(bakery2$cake,bakery2$pie)
plot(bakery2$cake,bakery2$coffee)
barplot(table(bakery2$weekday))
boxplot(bakery2$cookie~bakery2$weekday)

coplot(cookie ~ promotion | weekday *season , data = bakery2)

install.packages("lattice")
library(lattice)
histogram( ~cookie | promotion, data = bakery2)
bwplot( ~snack | weekday, data = bakery2)

library(ggplot2)
ggplot(bakery2, aes(x = promotion, y = pie)) + geom_boxplot()
ggplot(bakery2, aes(x = promotion, y = pie)) + geom_violin()


################################################################################################

# 구글지도 API
install.packages("ggmap")
library(ggmap)

install.packages("ggplot2")
library(ggplot2)


# cctv data 가져와서 저장.
cctv <- read.csv("R/koreacctv.csv", header = T)
head(cctv)
# 데이터프레임으로 만들어줌.
cctv <- as.data.frame(cctv)
str(cctv)
# cctv 데이터프레임에서 3,4,11,12열만 가져오기.
cctv2 <- cctv[  , c(3,4,11,12)] 
head(cctv2)


# 경도와 위도를 cent에 담는다.
cent <- c(lon=127, lat=37.6)  

# ggmap 패키지에서 get_googlemap()함수를 사용.
# 위에서 잡은 center를 지도의 중심으로 잡는다.
# 전체 세계지도 zoom=1, 숫자클수록 확대.
map2 <- ggmap(get_googlemap(center = cent, zoom=13, maptype='roadmap', color='bw'))
map2 # 지도 실행.
names(cctv)[11] <- "lat"
names(cctv)[12] <- "lon"
map2 + geom_point(data=cctv, aes(x=lon, y=lat), colour = 'gray10', alpha=0.6)


################################################################################################

# 5개의 주소 저장.
addr <- c("서울특별시 서초구 고무래로 35",
          "경기도 부천시 오정구 소사로 814",
          "경기도 용인시 수지구 풍덕천로 17 ",
          "서울특별시 서초구 신반포로 32",
          "경기도 과천시 별양로85")
addr

# geocode로 변환하여 gc에 저장.
gc <- geocode(enc2utf8(addr))
gc


df <- data.frame(gc,gc$lon,gc$lat)
df
center <- c(mean(gc$lon),mean(gc$lat))
center
map <- get_googlemap(center = center, maptype = "roadmap", zoom=12, marker = gc )
ggmap(map)
gmap <- ggmap(map)
gmap + geom_text(data=df, aes(x=gc.lon,y=gc.lat),size=5,label=df$name)


