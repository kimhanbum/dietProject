--설명 : 개인 정보(키/체중/목표)를 알 수  있습니다.
--1.ID는 FK로써, [1.회원정보]을 참조하고 참조 무결성을 유지한다.
--2.ID를 알면 회원정보를 회원정보 테이블에서 알 수 있다.
--3.HEIGHT는 40~240내외로 지정한다.
--4.WEIGHT는 40~200내외로 지정한다. 
--5.RMR의 정보는 개인정보 테이블의 HEIGHT/WEIGHT/GOAL 와 회원 정보 테이블의 GENDER/BIRTH를 이용해 지정 입력된다.
-- (기초 대사량 계산은 아래와 같고 GOAL에 따라 +300Kcal , - 300Kcal이 추가 연산 된다.)
-- 남)66.47+(13.75 x 체중) + (5 x 키) - (6.76 x 나이)
-- 여)665.1 + (9.56 x 체중) + (1.85 x 키) - (4.68 x 나이)

DROP TABLE PERSONAL_INFO purge;

CREATE TABLE PERSONAL_INFO(
    ID       		VARCHAR2(20) 	NOT NULL,    
    GOAL     		NUMBER(1) 		NOT NULL,   --목표(체중감소/유지/증가
    HEIGHT      	NUMBER(3)		NOT NULL,   --키 
    WEIGHT      	NUMBER(3)		NOT NULL,   --몸무게
    GOAL_WEIGHT  	NUMBER(3)		NOT NULL,   --목표 몸뭬
    RMR        		NUMBER(4)		NOT NULL,   --기초대사량
    FOREIGN KEY(ID) REFERENCES USER_INFO(ID) on delete cascade,
    PRIMARY KEY(ID)
);

