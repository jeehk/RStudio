#더하기 + 빼기 - 곱하기 * 나누기1 / 나누기2 %% 나누기3 %/% 제곱 ^ **
1+3
#[1] 4 에서 [1]의 의미는 인덱스
1:30
#1:30은 1~30까지를 의미
1:30+4
#1부터 30까지 각각 +4를 한다

9/2
# /는 일반적인 나누기
9%%2
#나누기한 나머지값
1:15%%2
#홀/짝 판단하는 경우 주로 사용
9%/%2
#몫 return (항상 정수형)




#비교 연산자: >, >=, <=, ==, !=
(1:15%%2)==1
#T/F로 return(논리형) 논리형 문자는 변수명으로 사용불가
#and &, or |


#return하는 자료구조가 중요!(return type)
#변수선언. 형은 자동으로 setting
x1=5
#복수일 경우 데이터타입, 구조, 인덱스 자동생성
x2=1:15
#복수의 변수에서 특정 값을 꺼낼때 [인덱스]
x2[7]
#복수의 변수에서 특정 값을 꺼낼때 [시작인덱스:끝인덱스]
x2[4:7]
#[] 사이에 조건식도 삽입해서 원하는 데이터 추출가능
x2[x2>=10]
#[] 사이에 조건식도 복수로 삽입가능
x2[x2>=10 & x2<=13]

x3=1.5

#문자를 변수로 지정할 경우 따옴표 통일(big/small 관계없음. 공백도 포함함)
x4='abc def'

#데이터타입 확인하는 함수. x2같은 벡터구조(1차수)도 확인가능. 몇차수인지, 몇자원으로 구성되있는지 확인
str(x3)
str(x1)
str(x4)
str(x2)

#matrix 구조선언(2차수)
#matrix 여러개인 구조(3차수)
#image (4, 5차수)


# 오른쪽값을 왼쪽에 대입: =, 지역변수: <-, ->, 전역변수: <<-, ->>
#c함수: 데이터를 벡터형태로 생성
x6=c(1,3,5)
x2[x6]
x2[c(1,3,5)]

#matrix 생성(행렬구조), array 생성(2차원 이상 구조)
#전체 데이터를 가져오는 matrix 완성. 열고정 or 행고정의 차이
matrix(1:15, nrow = 3)
matrix(1:15, ncol = 3)
#byrow : 데이터구조를 강제로 바꿔야하는 경우 사용하는 옵션, byrow면 가로방형으로 숫자 배정
matrix(1:15, ncol = 3, byrow = T)
x7=matrix(1:15, ncol = 3, byrow = T)
#구조정보 알려줌: n행 m열
dim(x7)
#내가 원하는 데이터구조로 강제로 바꿀때 dim 함수사용 : 5행3열의 값을 3행5열로 바꿈
dim(x7)=c(3,5)

#아래 두 수식은 동일한 의미
dim(x7)=c(1,15)
x8=matrix(x7, nrow=1, byrow=T)


#3차수 데이터 선언(행,열,면) - dim옵션 사용. 3차수는 엑셀의 워크시트가 2개 이상인 데이터구조
y1=array(1:30, dim=c(3,5,2))
#행, 열, 면의 index를 순서대로 표기
str(y1)
#첫번째 면에 있는 데이터 전체
y1[,,1]
y1[3,,]
y1[,5,]
y1[3,5,1]

######### 여기까지 선언한 데이터들은 모두 동일한 타입으로 들어가 있어야 한다. ############


#데이터프레임: 열별로 서로다른 데이터타입을 넣을 수 있는 구조
#data.frame : 열 단위로 데이터 타입 정의. 단 행에 null값이 있으면 안 됨
#factor : 범주형 변수
str(iris)
y2=data.frame(x=c(1,2,3), y=c(3.5, 3.2, 7.1), Z=c('A', 'B', 'c'))
str(y2)

#data frame 구조에서는 행(컬럼), 열(데이터row) 삽입가능
#1번째 row 추출
y2[,1]
#1~2번쨰 row 추출
y2[,1:2]
#1,3번째 row 추출
y2[,c(1,3)]

#x,y,z중 y컬럼의 데이터 전체 출력
y2[2]

#x,y컬럼의 3번째 row 출력
y2[3,c(1,2)]
y2[3, -3]

#2열 제외하고 나머지 값 출력
y2[-2,]

#data frame 구조에서 $ 사용가능: 벡터구조로 return
y2$x

#list구조: data frame 구조에 null까지 허용(길이가 달라도 됨). 실제로 대부분 사용하는 구조
#겉은 vector구조: 각각의 row별로 데이터타입 설정가능
#
y3=list(x=3,y=c(1,3,7),z=matrix(1:15, nrow = 3))
y3[3]
y3[[3]]

#3번째 matrix구조를 [[]] 여기 안에 호출한 뒤, 매트릭스의 데이터를 꺼내오는 표기방식을 뒤에 붙인다
y3[[3]][3,2]
#2번째 vector 구조안에 데이터를 꺼내올 때
y3[[2]][1]

#이중구조: list 안에 list
#최근 text mining은 다 이런 구조로 데이터 넣어줌. 따라서 데이터 구조를 파악하는 것이 대단이 중요함
y4=list(x=y3, y=y3)
str(y4)
y4[[1]]
y4[[1]][[3]][3,2]

#txt파일 line별로 읽어들이기
#외부데이터 읽어들일때 쓰는 함수
txt0=readLines('big.txt', encoding='UTF-8')
str(txt0)

#package 설치
install.packages("KoNLP")

#package내 fuction 사용
library(KoNLP)
txt1=extractNoun(txt0)

#list구조로 저장됨
str(txt1)

#Packages 클릭>Help에서 sejong사전 다운로드
useSejongDic()

#Packages 클릭>Help에서 SimplePos09,  SimplePos22 (https://github.com/haven-jeon/KoNLP/blob/master/etcs/KoNLP-API.md 참조)
SimplePos09(txt1)






