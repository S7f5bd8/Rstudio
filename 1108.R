library(rvest)
library(httr)
library(xml2)
library(XML)

url = "https://www.epeople.go.kr/nep/prpsl/opnPrpl/opnpblPrpslList.npaid"
html = read_html(url)
html

titles = html_nodes(html, ".left") %>% html_text()
titles

# 특수 문자열들a을 ""(empty string) 대체
titles = gsub("\r|\n|\t", "", titles)
titles

api = "http://apis.data.go.kr/B552584/ArpltnStatsSvc/getCtprvnMesureLIst"
api_key = "YNifAGAhsMES4u4RR7FC%2BaQDiG8yOP9yRzZ2v0PdiRtyHX7O76ybBpJl6bWge1SghMVNqMucJNzcwEe0YiF7qg%3D%3D"
returnType = "xml"
numOfRows = 10
pageNo = 1
itemCode = "PM10"
dataGubun = "HOUR"
searchCondition = "MONTH"

url = paste0(api, "?serviceKey=", api_key, 
             "&returnType=", returnType,
             "&numOfRows=", numOfRows, 
             "&pageNo=", pageNo, 
             "&itemCode=",itemCode, 
             "&dataGubun=", dataGubun,
             "&searchCondition=", searchCondition
)


url

url2 = "https://apis.data.go.kr/B552584/ArpltnStatsSvc/getCtprvnMesureLIst?serviceKey=YNifAGAhsMES4u4RR7FC%2BaQDiG8yOP9yRzZ2v0PdiRtyHX7O76ybBpJl6bWge1SghMVNqMucJNzcwEe0YiF7qg%3D%3D&returnType=xml&numOfRows=10&pageNo=1&itemCode=PM10&dataGubun=HOUR&searchCondition=MONTH"

install.packages("XML")
install.packages("httr")
library(httr)
library(xml2)
library(XML)

response = GET(url)
content = content(response, "text")

xmlFile = xmlParse(content, asText = TRUE)
xmlFile

# XML => 데이터프레임으로 변환
df = xmlToDataFrame(getNodeSet(xmlFile, "//items/item"))
df

library(ggplot2)

# df에서 필요한 데이터만 추출
# 제공되는 미세먼지 데이터 중에서 마지막 시간의 데이터가 1행
# 지역이 연속적이지 않기 때문에 아래와 같은 데이터 추출이 필요

pm = df[1, c(1:16, 19)]
pm

# 지역별 미세먼지 데이터프레임의 행과 열을 바꾸기
pm.region = t(pm)
pm.region

# 행열데이터를 데이터프레임으로 변환(미세먼지를 문자열에서 숫자형태로)
df.region = as.data.frame(pm.region)
df.region

# 1로 되어있는 컬럼 이름을 PM10 컬럼명으로 변경
colnames(df.region) = "PM10"
df.region

# df.region에 컬럼 추가(컬럼명 : name, 값: 한글자명)
df.region$NAME = c("대구광역시", "충청남도", "인천광역시", "대전광역시", "경상북도", 
                    "세종특별자치시", "광주광역시", "전라북도", "강원도", 
                    "울산광역시", "전라남도", "서울특별시", "부산광역시", 
                    "제주특별자치도", "충청북도", "경상남도", "경기도")
df.region

#행정경계 데이터셋을 사용한 지도 시각화
install.packages("sf")
library(sf)
library(dplyr)

#행정경계 데이터셋 (shape[.shp] 파일)읽어오기
map =st_read("C:/Rstdio/Z_NGII_N3A_G0010000.shp",  options = "ENCODING=EUC-KR")
map

# WGS84좌표계
crs_wgsw84 = st_crs(4326)

# wgs84좌표계로 mzp을 변환
map_sf = st_tranform(map, crs_wgs84)
map_sf

#sf객체를 데이터프레임으로 변환
df_map = st_as_sf(map_sf)
df_map

# 지형정보 확인
st_geometry(map)

#df_map 데이터프레임의 구조 확인
str(df_map)

#그룹화 변수 확인
table(df_map$id)
names(str(df_map))

#경도와 위도를 추출해서 저장
#현재 df_map이 유요한 데이터임을 증명
df_map = st_make_valid(df_map)
df_map

df_map2 = st_make_valid(df_map)
total_londlat = df_map %>%
  summarise(geometry = st_centroid(st_union(geometry)), .groups="drop") %>%
  mutate(long = st_coordinates(geometry)[,1],
         lat = st_coordinates(geometry)[,2])
total_londlat

# id(UFID)를 기준으로 그룹화
longlat <- df_map %>% group_by(UFID) %>%
  summarise(geometry = st_centroid(st_union(geometry)), .groups="drop") %>%
  mutate(long = st_coordinates(geometry)[,1],
         lat = st_coordinates(geometry)[,2])

longlat

# 경도위도 데이터셋의 결과를 데이터프레임으로 변환
longlat_df <- longlat %>% st_drop_geometry() %>% as.data.frame()

longlat_df
str(longlat_df)
longlat_df
df.region

# 공간정보 데이터프레임에서 기하학적 정보를 제거하는 기능
df_map_info <- st_drop_geometry(df_map)
df_map_info

longlat <- cbind(longlat, NAME = df_map_info[, 3])
longlat
df_PM10 <- merge(x = df_region, y = longlat, by = "NAME", all = TRUE)
df_PM10

library(ggplot2)

ggplot() +
  #geom_sf(data=map,
   #       fill="white",
    #      alpha=0.5,
     #     color="black")+
  geom_polygon(data=loglat,
               aes(x=long, y=lat),
               fill="white",
               alpha=0.5,
               color="black"
               )+
  geom_point(data = df.pm10, aes(x=long, y=lat, size=pm10),
             shape=21, color="black", fill="red", alpha=0.3)+
  theme(legend.position = "none")+
  labs(title="PM10 능동 분포", x="경도", y="위도")
            



















 























































