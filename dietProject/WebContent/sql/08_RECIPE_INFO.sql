--설명 : 레시피 정보를 알 수 있습니다.
--1.RECIPE_DATE는 YYYY/mm/dd 형식으로 저장한다.
--2.ID는 FK로써, [1.회원정보]을 참조하고 참조 무결성을 유지한다.
--RECIPE_NUM       	NUMBER(3)    	NOT NULL,    --레시피 번호
DROP TABLE RECIPE_INFO cascade constraints purge;

CREATE TABLE RECIPE_INFO(
	ID       			VARCHAR2(20)   	NOT NULL,    --아이디
	RECIPE_CODE       	VARCHAR2(4)    	NOT NULL,    --레시피코드
    RECIPE_SUBJECT      VARCHAR2(300)   NOT NULL,    --레시피 제목
    RECIPE_CONTENT      VARCHAR2(4000)	NOT NULL,    --레시피 내용
    RECIPE_SUMMARY      VARCHAR2(300),    			 --레시피 특징
    RECIPE_FILE     	VARCHAR2(50),    			 --레시피 이미지
    RECIPE_DATE   		DATE 	 default sysdate,    --레시피 작성 날짜(insert시 자동 날짜 입력됨)
    FOREIGN KEY(ID) REFERENCES USER_INFO(ID) on delete cascade,
    PRIMARY KEY(RECIPE_CODE)
);

