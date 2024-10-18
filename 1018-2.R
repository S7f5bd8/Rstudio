install.packages("sf")
install.packages("ggplot2")
install.packages("rgdal")
library(ggplot2)
library(rgdal)
library(sf)

# 행정경계 데이터셋(shape[.shp] 파일) 읽어오기
map =st_read("C:/Rstdio/Z_NGII_N3A_G0010000.shp")

ggplot(data = df_map) +
  geom_sf(fill="white", color="black")

# 행정경계의 시도(id)의 배경색을 다르게 지정
# id 설정
if(!'id' %in% names(df_map)){
  df_map$id = 1:nrow(df_map)
}

ggplot(data = df_map) +
  geom_sf(aes(fill = id), alpha = 0.3, color = "black") +
  theme(legend.position = "none")
  labs(x="경도",y="위도")

install.packages("openxlsx")
library(openxlsx)
  
df = read.xlsx("C:/Rstdio/국내지진목록.xlsx")
head(df)

#X8열에서 북한으로 시작하는 데이터의 행번호 추출

idx = grep("^북한", df$x8)
#북한지역의 x8열의 데이터를 확인
df[idx, 'x8']

#df에 있는 6열과 7열의 데이터 중 N과 E를 삭제하는 방법
df[, 6]= gsub("N", "", df[,6])





