--설명 : 식단에 달린 댓글 정보를 알 수 있습니다.
--1.DIET_CODE를 알면 식단 정보를 식단테이블에서 알 수 있다.
--2.DIET_CODE는 FK로써, [4.식단]을 참조하고 참조 무결성을 유지한다.
--3.ID는 FK로써 , [1.회원정보]를 참조하고 참조 무결성을 유지한다.
--4.DIET_RE_CONTENT는 50자(한글기준)내외로 지정한다.

DROP TABLE DIET_REPLY purge;

CREATE TABLE DIET_REPLY(
	ID       			VARCHAR2(20)   	NOT NULL,    --아이디
	DIET_CODE       	VARCHAR2(4)    	NOT NULL,    --식단코드
	DIET_RE_NUM       	NUMBER(3)       NOT NULL,    --식단 댓글 번호
	DIET_RE_SEQ       	NUMBER(3)       NOT NULL,    --식단 댓글 순서
    DIET_RE_CONTENT     VARCHAR2(160)   NOT NULL,    --식단 댓글 내용
    DIET_RE_DATE   		DATE 	 default sysdate,    --댓글 작성 날짜(insert시 자동 날짜 입력됨)
    FOREIGN KEY(ID) REFERENCES USER_INFO(ID) on delete cascade,
    FOREIGN KEY(DIET_CODE) REFERENCES DIET_INFO(DIET_CODE) on delete cascade,
    PRIMARY KEY(DIET_RE_NUM)
);

