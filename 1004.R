install.packages("dplyr")
install.packages("gapminder")

library(dplyr)
library(gapminder)

# 시계열 데이터 그래프 애니메이션
# 전 세계 국가(핀란드. 대한민국, 베트남)에 대한 연도별 기대 수명과 국내총생산(GDP)의 관계
# gapminder dataset 확인

gapminder

# 전 세계 국가 중에서 3개국 (핀란드, 대한민국, 베트남) 데이터만 필터링해서 추출

df = gapminder %>% filter(country == "Finland" | country == "Korea, Rep." | country == "Vietnam")

df

# 시계열 데이터 그래프
# x축: 1인당 총 생산, y축: 기대수명
# 애니메이션 설정 추가

anim = ggplot(df, aes(x = gdpPercap, y = lifeExp, size = pop, colour = country)) +
  geom_point(alpha = 0.5) +
  scale_size(range = c(5, 15)) +
  labs(title = "연도: {frame_time}", x = "1인당 GDP", y = "기대 수명") +
  transition_time(year) +
  shadow_wake(0.5)

# 애니메이션 실행
animate(anim, width = 500, height = 400, duration = 10, renderer = gifski_renderer(loop = FALSE))

# 그림 애니메이션: 양궁
# 필요한 패키지 설치 및 로드
# 필요한 패키지 설치 및 로드
install.packages("magick")
library(magick)

# 이미지 파일 불러오기
bg = image_read("C:\\Rstdio\\background.png")
target = image_read("C:\\Rstdio\\target.png")
arrow = image_read("C:\\Rstdio\\arrow.png")

# 이미지 크기 조정
bg = image_scale(bg, "600x300!")
target = image_scale(target, "80x170!")
arrow = image_scale(arrow, "100x25!")

# 화살 이미지 회전 (초기 상태)
arrow = image_rotate(image_background(arrow, "none"), -11)

# 과녁을 배경에 합성
bg2 = image_composite(bg, target, offset = geometry_point(450, 80))

# 화살 위치 초기화
# 필요한 패키지 설치 및 로드
install.packages("magick")
library(magick)

# 이미지 파일 불러오기
bg = image_read("C:\\Rstdio\\background.png")
target = image_read("C:\\Rstdio\\target.png")
arrow = image_read("C:\\Rstdio\\arrow.png")

# 이미지 크기 조정
bg = image_scale(bg, "600x300!")
target = image_scale(target, "80x170!")
arrow = image_scale(arrow, "100x25!")

# 화살 이미지 회전 (초기 각도 설정)
arrow = image_rotate(image_background(arrow, "none"), -11)

# 과녁을 배경에 합성
bg2 = image_composite(bg, target, offset = geometry_point(450, 80))

# 화살의 초기 위치 설정
# 필요한 패키지 설치 및 로드
install.packages("magick")
library(magick)

# 이미지 파일 불러오기
bg = image_read("C:\\Rstdio\\background.png")
target = image_read("C:\\Rstdio\\target.png")
arrow = image_read("C:\\Rstdio\\arrow.png")

# 이미지 크기 조정
bg = image_scale(bg, "600x300!")
target = image_scale(target, "80x170!")
arrow = image_scale(arrow, "100x25!")

# 화살 이미지 회전 (초기 각도 설정)
arrow = image_rotate(image_background(arrow, "none"), -11)

# 과녁을 배경에 합성
bg2 = image_composite(bg, target, offset = geometry_point(450, 80))

# 화살의 초기 위치 설정
# 필요한 패키지 설치 및 로드
install.packages("magick")
library(magick)

# 이미지 파일 불러오기
bg = image_read("C:\\Rstdio\\background.png")
target = image_read("C:\\Rstdio\\target.png")
arrow = image_read("C:\\Rstdio\\arrow.png")

# 이미지 크기 조정
bg = image_scale(bg, "600x300!")
target = image_scale(target, "80x170!")
arrow = image_scale(arrow, "100x25!")

# 과녁을 배경에 합성
bg2 = image_composite(bg, target, offset = geometry_point(450, 80))

# 화살의 초기 위치 설정
# 필요한 패키지 설치 및 로드
install.packages("magick")
library(magick)

# 이미지 파일 불러오기
bg = image_read("/mnt/data/image.png")  # 배경 이미지 경로
target = image_read("C:\\Rstdio\\target.png")
arrow = image_read("C:\\Rstdio\\arrow.png")

# 이미지 크기 조정
bg = image_scale(bg, "800x400!")  # 배경 크기 조정
target = image_scale(target, "80x170!")
arrow = image_scale(arrow, "100x25!")

# 과녁을 배경에 합성
bg2 = image_composite(bg, target, offset = geometry_point(600, 150))  # 과녁 위치 조정

# 필요한 패키지 설치 및 로드
install.packages("magick")
library(magick)

# 이미지 파일 불러오기
bg = image_read("/mnt/data/image.png")  # 배경 이미지 경로
target = image_read("C:\\Rstdio\\target.png")
arrow = image_read("C:\\Rstdio\\arrow.png")

# 이미지 크기 조정
bg = image_scale(bg, "800x400!")  # 배경 크기 조정
target = image_scale(target, "80x170!")
arrow = image_scale(arrow, "100x25!")

# 과녁을 배경에 합성 (배경의 오른쪽에 위치)
bg2 = image_composite(bg, target, offset = geometry_point(600, 150))  # 과녁 위치 조정

# 화살의 초기 위치 설정 (배경 왼쪽 중간)
# 필요한 패키지 설치 및 로드
# 필요한 패키지 설치 및 로드
# 필요한 패키지 설치 및 로드
install.packages("magick")
library(magick)

# 이미지 파일 불러오기
bg = image_read("C:\\Rstdio\\background.png")
target = image_read("C:\\Rstdio\\target.png")
arrow = image_read("C:\\Rstdio\\arrow.png")

# 이미지 크기 조정
bg = image_scale(bg, "600x300!")
target = image_scale(target, "80x170!")
arrow = image_scale(arrow, "100x25!")

# 화살 이미지 회전
arrow <- image_rotate(image_background(arrow, "none"), -21)

# 과녁을 배경에 합성
bg2 <- image_composite(bg, target, offset = geometry_point(450, 80))

# 화살 위치 초기화
x = 0
y = 220
angle = -11 # 초기 각도 설정

arrow_centered = image_background(arrow, "none") # 배경 없애기
while(TRUE){
  # 화살 이미지 위치 (x, y)
  position = geometry_point(x, y)
  arrow_rotated = image_rotate(arrow_centered, angle) # 화살 회전
  # 이미지 합성: bg2(배경 + 과녁) + arrow(화살)
  img = image_composite(bg2, arrow_rotated, offset=position)
  
  print(img)
  
  Sys.sleep(0.1)
  
  if (x == 380)

    
        break
  
  
  if (x >= 230) {
    angle = 11
    arrow_rotated = image_rotate(arrow_centered, angle) # 화살 회전
  } else {
    arrow_rotated = arrow_centered
  }
  
  x = x + 20
  y = y - 18
  
}












