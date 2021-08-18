--설명 : 기성식단/간식 정보를 알 수  있습니다.
--1.MEAL_CODE는  맨 앞자리에 M 1자리, 순차적 번호를 합쳐서 구성합니다.

DROP TABLE MEAL_INFO purge;

CREATE TABLE MEAL_INFO(
	MEAL_CODE      VARCHAR2(4)    	NOT NULL,    --기성식단 코드
	MEAL_NAME      VARCHAR2(30)     NOT NULL,    --기성식단 이름
	MEAL_IMG_NAME  VARCHAR2(30)     NOT NULL,    --기성식단 이름
    MEAL_CARB      NUMBER(3)	 	NOT NULL,    --기성식단 탄수 g
    MEAL_FAT  	   NUMBER(3)	 	NOT NULL,    --기성식단 지방 g
    MEAL_PROTEIN   NUMBER(3)	 	NOT NULL,    --기성식단 단백 g
    MEALL_CAL      NUMBER(4)	 	NOT NULL,    --기성식단 총 칼로리
    PRIMARY KEY(MEAL_CODE)
);

