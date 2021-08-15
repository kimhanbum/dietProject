--설명 : 레시피에 달린 댓글 정보를 알 수 있습니다.
--1.RECIPE를 알면 레시피 정보를 레시피테이블에서 알 수 있다.
--2.RECIPE_CODE는 FK로써, [8.레시피]을 참조하고 참조 무결성을 유지한다.
--3.ID는 FK로써 , [1.회원정보]를 참조하고 참조 무결성을 유지한다.
--4.RECIPE_RE_CONTENT는 50자(한글기준)내외로 지정한다.

DROP TABLE RECIPE_REPLY purge;

CREATE TABLE RECIPE_REPLY(
	ID       			VARCHAR2(20)   	NOT NULL,    --아이디
	RECIPE_CODE       	VARCHAR2(4)    	NOT NULL,    --레시피 코드
	RECIPE_RE_NUM       NUMBER(3)    	NOT NULL,    --레시피 댓글 번호
	RECIPE_RE_SEQ       NUMBER(3)       NOT NULL,    --레시피 댓글 순서
    RECIPE_RE_CONTENT   VARCHAR2(160)   NOT NULL,    --레시피 댓글 내용
    RECIPE_RE_DATE   	DATE 	 default sysdate,    --댓글 작성 날짜(insert시 자동 날짜 입력됨)
    FOREIGN KEY(ID) REFERENCES USER_INFO(ID) on delete cascade,
    FOREIGN KEY(RECIPE_CODE) REFERENCES RECIPE_INFO(RECIPE_CODE) on delete cascade,
    PRIMARY KEY(RECIPE_RE_NUM)
);

