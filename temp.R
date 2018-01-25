#### 1. csv 파일 읽어들이기: data.frame 구조
# csv 파일 읽어들일 때 구분자(,)가 본문에 포함되어 있는지, 특수기호(', ", #) 있는지 사전에 체크 후 제거해줘야 한다.

SOP_201701 <- read.table("201701_SOP.csv", header = T, sep = ",")
SOP_201702 <- read.table("201702_SOP.csv", header = T, sep = ",")
SOP_201703 <- read.table("201703_SOP.csv", header = T, sep = ",")
SOP_201704 <- read.table("201704_SOP.csv", header = T, sep = ",")
SOP_201705 <- read.table("201705_SOP.csv", header = T, sep = ",")
SOP_201706 <- read.table("201706_SOP.csv", header = T, sep = ",")
SOP_201707 <- read.table("201707_SOP.csv", header = T, sep = ",")
SOP_201708 <- read.table("201708_SOP.csv", header = T, sep = ",")
SOP_201709 <- read.table("201709_SOP.csv", header = T, sep = ",")
SOP_201710 <- read.table("201710_SOP.csv", header = T, sep = ",")
SOP_201711 <- read.table("201711_SOP.csv", header = T, sep = ",")
SOP_201712 <- read.table("201712_SOP.csv", header = T, sep = ",")
str(SOP_201701)
View(SOP_201701_1)

# read할 때 오류나면 N/A로 채워서  view로 어떤 값이 빠져있는지 확인한다.
SOP_201701 <- read.table("201701_SOP.csv", header = T, sep = ",", fill = T)

#### 2. N/A값 제거, 불필요한 컬럼 제거
SOP_201701_1 <- SOP_201701[, c(1, 2, 5, 12, 21, 22, 23, 30, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 79)]
is.na(SOP_201701_1)
str(SOP_201701_1)
View(SOP_201701_1)

SOP_201702_1 <- SOP_201702[, c(1, 2, 5, 12, 21, 22, 23, 30, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 79)]
SOP_201703_1 <- SOP_201703[, c(1, 2, 5, 12, 21, 22, 23, 30, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 79)]
SOP_201704_1 <- SOP_201704[, c(1, 2, 5, 12, 21, 22, 23, 30, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 79)]
SOP_201705_1 <- SOP_201705[, c(1, 2, 5, 12, 21, 22, 23, 30, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 79)]
SOP_201706_1 <- SOP_201706[, c(1, 2, 5, 12, 21, 22, 23, 30, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 79)]
SOP_201707_1 <- SOP_201707[, c(1, 2, 5, 12, 21, 22, 23, 30, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 79)]
SOP_201708_1 <- SOP_201708[, c(1, 2, 5, 12, 21, 22, 23, 30, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 79)]
SOP_201709_1 <- SOP_201709[, c(1, 2, 5, 12, 21, 22, 23, 30, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 79)]
SOP_201710_1 <- SOP_201710[, c(1, 2, 5, 12, 21, 22, 23, 30, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 79)]
SOP_201711_1 <- SOP_201711[, c(1, 2, 5, 12, 21, 22, 23, 30, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 79)]
SOP_201712_1 <- SOP_201712[, c(1, 2, 5, 12, 21, 22, 23, 30, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 79)]

# factor -> char로 변환
is.character(SOP_201702_1[,11])
SOP_201701_1[,11] <- as.character(SOP_201701_1[,11])
SOP_201702_1[,11] <- as.character(SOP_201702_1[,11])
SOP_201703_1[,11] <- as.character(SOP_201703_1[,11])
SOP_201704_1[,11] <- as.character(SOP_201704_1[,11])
SOP_201705_1[,11] <- as.character(SOP_201705_1[,11])
SOP_201706_1[,11] <- as.character(SOP_201706_1[,11])
SOP_201707_1[,11] <- as.character(SOP_201707_1[,11])
SOP_201708_1[,11] <- as.character(SOP_201708_1[,11])
SOP_201709_1[,11] <- as.character(SOP_201709_1[,11])
SOP_201710_1[,11] <- as.character(SOP_201710_1[,11])
SOP_201711_1[,11] <- as.character(SOP_201711_1[,11])
SOP_201712_1[,11] <- as.character(SOP_201712_1[,11])

# 2017년 전체 파일 생성
SOP_2017_1 <- rbind(SOP_201701_1, SOP_201702_1, SOP_201703_1, SOP_201704_1, SOP_201705_1, SOP_201706_1, SOP_201707_1,
                    SOP_201708_1, SOP_201709_1, SOP_201710_1, SOP_201711_1, SOP_201712_1)
View(SOP_2017_1)


#### 3. 컬럼 rename
# names(data.frame)[1:n] <-c("A", "B", ...)
# plyr 패키지 사용 data.frame <- rename(data.frame, c(col1="A", col2="B", ...))
library(plyr)


#### 4. 결과값 보기

## 장애종결 VS 접수반려 건수 
newdata <- subset(SOP_2017_1, 장애상태 == "접수반려")
View(newdata)
str(newdata)

## 2017년 SOP 평균조치시간
newdata <- subset(SOP_2017_1, 장애상태 != "접수반려", select = c(4, 12, 22))
# 평균값
mean(newdata[,3]) #32.71873 -> 30.66557
# 중간값
median(newdata[,3]) #25
# 분산
var(newdata[,3]) #8259.027 -> 540.811
# 표준편차
sd(newdata[,3]) #90.87919 -> 23.25534
# 최소값, 최대값
min(newdata[,3]) #1
max(newdata[,3]) #3790 -> 175

# 그래프를 통해 분포를 보고 비정상적인 값은 찾아내 제외한다.
library(ggplot2)
ggplot(newdata, aes(x = 최초문의시간, y = 시간, group = 1)) + 
  #  geom_line() + 
  ylim(0, max(newdata$시간)) +
  geom_point()

# 비정상적인 값 찾기
maxdata <- subset(newdata, 시간>=3790, select = c(1:3))
View(maxdata)

# 제거
newdata <- subset(newdata, 시간<3790, select = c(1:3))

# 최종 데이터 통계요약본
summary(newdata)


## 월별 SOP 관련 데이터
# newdata에서 yyyymmdd값을 찾아낸다.
newdata <- transform(newdata, date = as.character(substr(newdata[,2], 1, 10)))
newdata <- transform(newdata, month = as.factor(substr(newdata[,4], 6,7)))
newdata <- transform(newdata, day = as.factor(substr(newdata[,4], 9,10)))

str(newdata)

ggplot(newdata, aes(x = month, y = 시간, color = month)) + 
    geom_point()

# 월별 시간 평균
install.packages("doBy")
library(doBy)
month_rslt <- summaryBy(시간 ~ month, data=newdata , FUN=c(mean, max))

ggplot(month_rslt, aes(x = month, y = 시간.mean)) + 
  geom_bar(stat = "identity") + 
  geom_text(aes(label = 시간.mean), vjust = 1.5, color = "white")

# 요청자 - mvno 사업자
# 처리자
# 서비스유형(중), 서비스유형(소)
# 원인명, 해결명
View(SOP_2017_1)
View(newdata2)

newdata2 <- SOP_2017_1[,c(12,3,5,6,8,9,10)]
str(newdata2)
summary(newdata2)

newdata2 <- transform(newdata2, date = as.character(substr(newdata2[,1], 1, 10)))
newdata2 <- transform(newdata2, month = as.factor(substr(newdata2[,8], 6,7)))
newdata2 <- transform(newdata2, day = as.factor(substr(newdata2[,8], 9,10)))

library(ggplot2)
ggplot(newdata2, aes(x=요청자)) +
  geom_bar(fill="white", colour="black")

ggplot(newdata2, aes(x=처리자명)) +
  geom_bar(fill="white", colour="black")

ggplot(newdata2, aes(x=해결명)) +
  geom_bar(fill="white", colour="black")

  
# 제목
# 조치내역
View(newdata3)
newdata3 <- SOP_2017_1[,c(12,5,6,7,8,9,10,11,3)]
str(newdata3)
summary(newdata3)

newdata3 <- transform(newdata3, date = as.character(substr(newdata3[,1], 1, 10)))
newdata3 <- transform(newdata3, month = as.factor(substr(newdata3[,10], 6,7)))
newdata3 <- transform(newdata3, day = as.factor(substr(newdata3[,10], 9,10)))
newdata3 <- transform(newdata3, 제목= as.character(newdata3[,4]))

# sort후 가장 많이 들어온 sop 순위별로 추출
library(plyr)
newdata3 <- arrange(newdata3, 제목)

library(dplyr)
newdata3 %>% 
  group_by(제목) %>% 
  summarise(n = n())

t <- newdata3 %>%
      count(제목)
t <- arrange(t, desc(n))

# 제목 전처리
# [] 제거
View(t)
tail(t)
t <- gsub("\\[", "", t[,1])
t <- gsub("\\]", "", t)
# 단어 제거
t <- gsub("문의", "", t)
t <- gsub("요청", "", t)
t <- gsub("긴급", "", t)


# word count
install.packages("splitstackshape")
library(splitstackshape)

title <- data.frame(table(unlist(strsplit(tolower(title$제목), " "))))
title <- arrange(title, desc(Freq))

t <- data.frame(table(unlist(strsplit(tolower(t), " "))))
t <- t[order(-t$Freq),]

View(t)

