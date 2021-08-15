--설명 : 구성한 식단의 정보를 알 수 있습니다.
--1.DIET_DATE는 YYYY/mm/dd 형식으로 저장한다.
--2.DIET_CODE는  맨 앞자리에 D 1자리, 순차적 번호를 합쳐서 구성합니다.
--3.ID는 FK로써, [1.회원정보]을 참조하고 참조 무결성을 유지한다.

DROP TABLE DIET_INFO cascade constraints purge;

CREATE TABLE DIET_INFO(
	ID       			VARCHAR2(20)   	NOT NULL,    --아이디
	DIET_CODE       	VARCHAR2(4)    	NOT NULL,    --식단코드
	DIET_NAME       	VARCHAR2(30)    NOT NULL,    --식단이름
    DIET_FORM       	VARCHAR2(90)    NOT NULL,    --구성식자재
    DIET_SHARE     		NUMBER(1) 		NOT NULL,    --식단 공유 여부
    DIET_RECOMM       	NUMBER(3)	 	NOT NULL,    --추천수
    DIET_TOTAL_CARB     NUMBER(3)	 	NOT NULL,    --식단 총 탄수 g
    DIET_TOTAL_FAT  	NUMBER(3)	 	NOT NULL,    --식단 총 지방 g
    DIET_TOTAL_PROTEIN  NUMBER(3)	 	NOT NULL,    --식단 총 단백 g
    DIET_TOTAL_CAL      NUMBER(4)	 	NOT NULL,    --식단 총 칼로리
    DIET_DATE   		DATE 	 default sysdate,    --식단 작성 날짜(insert시 자동 날짜 입력됨)
    FOREIGN KEY(ID) REFERENCES USER_INFO(ID) on delete cascade,
    PRIMARY KEY(DIET_CODE)
);


drop sequence diet_seq;
  
--시퀀스를 생성합니다. 
create sequence diet_seq;
