install.packages("ggplot2")
library(ggplot2)
install.packages("sqldf")
library(sqldf)
install.packages("dplyr")
library(dplyr)
install.packages("wordcloud2")
library(wordcloud2)

# csv 파일 읽어들이기
inv_info_2017 <- read.table("inv_info_2017_1.csv", header = T, sep = ",")
str(inv_info_2017)
View(inv_info_2017)

# 특정월의 사업자별 청구금액 현황
inv_201701 <- filter(inv_info_2017, INV_YYMM == 201701)
View(inv_201701)
str(inv_201701)
inv_201701 <- cbind(inv_201701, c("UVO", "SKTL", "EYES", "UNCM", "GHSC", "SMTL", "EMRT", "SONE", "FREE", "CJH", "JYTL"))
names(inv_201701)[6] <- "NM2"

ggplot(inv_201701, aes(x = NM, y = SUM)) + 
  xlab("2017 1월 MVNO 사업자")+
  ylab("청구금액")+
  ylim(0, max(inv_201701$SUM)) +
  geom_bar(stat = "identity")


# 텔링크 월별 청구금액 추이 그래프
inv_info_2017 <- inv_info_2017[order(inv_info_2017$GB_CD),]
inv_sktl <- inv_info_2017[13:24, c("INV_YYMM", "GB_CD", "SUM")]
inv_sktl <- transform(inv_sktl, INV_YYMM = as.factor(INV_YYMM))

View(inv_sktl)
head(inv_sktl, 12)
str(inv_sktl)

ggplot(inv_sktl, aes(x = INV_YYMM, y = SUM, group = 1)) + 
  geom_line() + 
  ylim(0, max(inv_sktl$SUM)) +
  geom_point()




# csv 파일 읽어들이기
user_info_2017 <- read.table("user_info_2017.csv", header = T, sep = ",")
str(user_info_2017)
View(user_info_2017)

user_info_2017 <- transform(user_info_2017, SCRB_YYMM = as.factor(SCRB_YYMM))
user_info_2017 <- transform(user_info_2017, FINAL_CNT = as.integer(SCRB_CNT-TERM_CNT))
user_info_2017 <- user_info_2017[1:229, ]

## 월별 선불 최종 사용자 추출
user_info_ppay <- subset(user_info_2017, GB_CD == "M00030" | 
                           GB_CD == "M00050" |
                           GB_CD == "M00070" |
                           GB_CD == "M00110" |
                           GB_CD == "M00120" |
                           GB_CD == "M00140" |
                           GB_CD == "M00160" |
                           GB_CD == "M00170" |
                           GB_CD == "M00180" |
                           GB_CD == "M00220" |
                           GB_CD == "M00240",
                         select =c("SCRB_YYMM", "GB_CD", "FINAL_CNT"))
user_info_ppay <- transform(user_info_2017, NM = c())
View(user_info_ppay)

ggplot(user_info_ppay, aes(x = SCRB_YYMM, y = FINAL_CNT, color = GB_CD, group = GB_CD)) + 
  geom_line()+
  geom_point()+
#  geom_text(aes(label = FINAL_CNT), size = 3)
geom_text(aes(y = FINAL_CNT + 0.5, label = FINAL_CNT), size = 4, vjust = 0)

ggplot(user_info_ppay, aes(x = SCRB_YYMM, y = FINAL_CNT, fill = GB_CD, order = desc(GB_CD))) + 
  geom_bar(stat = "identity")  
