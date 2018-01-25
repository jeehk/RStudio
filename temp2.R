#### 0. 초기화
rm(list = ls())
library(plyr)
library(reshape2)

# list.files('.', pattern = '.csv')

# csv 파일 읽어들일 때 구분자(,)가 본문에 포함되어 있는지, 특수기호(', ", #) 있는지 사전에 체크 후 제거해줘야 한다.

#### 1. csv 파일 읽어들이기: data.frame 구조
file_list <- data.frame()
file_name1 <- "2017_"
for(i in 1:12){
  # csv 파일명
  file_name2 <- ""
  file_name2 <- paste(file_name1, i, ".csv", sep = "")  
  # csv 파일변수
  file_name3 <- ""
  file_name3 <- paste(file_name1, i, sep = "")
  file_name3 <- read.table(file_name2, header = T, sep = ",") 
  # 최종 데이터프레임
  file_list <- rbind.fill(file_list, file_name3)
  print(paste("succeed to read", file_name2))
}

#View(file_list)
#str(file_list)

#### 2. 불필요한 컬럼 제거
# 데이터 총건수
total_cnt <- nrow(file_list)

# 컬럼 전체가 NA인 것은 제외한다
file_list <- file_list[, colSums(is.na(file_list)) < total_cnt]

str(file_list)

# 데이터프레임에 NA값 있는지 확인
# colSums(is.na(file_list_1))
# NA값 0으로 대체
# file_list[is.na(file_list)] <- 0

#### 3. 데이터 유형변경
#텍스트분석을 위해 특정컬럼은 factor -> char로 변환
file_list[,"제목"] <- as.character(file_list[,"제목"])
file_list[,"조치내역"] <- as.character(file_list[,"조치내역"])

#### 4. 결과값 보기
# 컬럼 갯수
total_col_cnt <- ncol(file_list)
total_row_cnt <- nrow(file_list)

names(file_list)[j]

# 전체 summary
summary(file_list)

str(file_list)


file_list_factor <- c(1:total_row_cnt,1)
file_list_character <- c(1:total_row_cnt,1)
file_list_integer <- c(1:total_row_cnt,1)
for(j in 1:total_col_cnt){
#   col_type <- is.factor(file_list$j)
  if(is.factor(file_list[,j]) == TRUE)
    file_list_factor <- cbind(file_list_factor, file_list[, j])     
  # name(file_list)[j]
  else  print("not factors")
  if(is.character(file_list[,j]) == TRUE)
    file_list_character <- cbind(file_list_character, file_list[, j])
  else  print("not characters")
  if(is.integer(file_list[,j]) == TRUE)
    file_list_integer <- cbind(file_list_integer, file_list[, j])
  else  print("not integers")
}
