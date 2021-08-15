--설명 : 문의사항 정보를 알 수 있습니다.
--1.QUESTION_DATE는 YYYY/mm/dd 형식으로 저장한다.
--2.ID는 FK로써, [1.회원정보]을 참조하고 참조 무결성을 유지한다.

DROP TABLE QUESTION_INFO purge;

CREATE TABLE QUESTION_INFO(
    ID           		VARCHAR2(20) 	 NOT NULL,  --아이디   
    QUESTION_NUM        NUMBER(3)   	 NOT NULL,	--문의 사항 번호
    QUESTION_SUBJECT    VARCHAR2(300)    NOT NULL,	--문의 사항 제목
    QUESTION_CONTENT    VARCHAR2(4000)   NOT NULL,	--문의 사항 내용
    QUESTION_DATE       DATE default sysdate,  		--문의 사항 작성 날짜(INSERT시 자동 입력)
    QUESTION_RE_REF     NUMBER(3),  				--댓글에  해당되는 문의 사항 번호
    QUESTION_RE_LEV     NUMBER(1),      			--댓글 레벨
    QUESTION_SEQ        NUMBER(1),       			--댓글 순서
    FOREIGN KEY(ID) REFERENCES USER_INFO(ID) on delete cascade,
    PRIMARY KEY(QUESTION_NUM)
);







