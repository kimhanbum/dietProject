--설명 :식자재 정보를 알 수  있습니다.

DROP TABLE FOOD_INFO purge;

CREATE TABLE FOOD_INFO(
    FOOD_CODE       NUMBER(3)    NOT NULL,    --식자재코드
    FOOD_NAME     	VARCHAR2(30) NOT NULL,    --식자재이름
    FOOD_CARB       NUMBER(3)	 NOT NULL,    --탄수화물 g수
    FOOD_FAT      	NUMBER(3)	 NOT NULL,    --지방 g수
    FOOD_PROTEIN  	NUMBER(3)	 NOT NULL,    --단백질 g수
    FOOD_CAL        NUMBER(4)	 NOT NULL,    --식자재 칼로리
    FOOD_TYPE       NUMBER(2)	 NOT NULL,    --음식 타입(1.채소 2.과일 3.어류 4.육류 5.해좋류 6.견과류)
    NUTRIENT_TYPE   NUMBER(1)	 NOT NULL,    --영양소 타입(1.탄수위주 2.단백위주 3.지방위주)
    PRIMARY KEY(FOOD_CODE)
);


drop sequence food_seq;
  
--시퀀스를 생성합니다. 
create sequence food_seq;






