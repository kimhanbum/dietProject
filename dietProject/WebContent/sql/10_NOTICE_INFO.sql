--설명 : 공지사항 정보를 알 수 있습니다.
--1.NOTICE_DATE는 YYYY/mm/dd 형식으로 저장한다.
--2.ID는 FK로써, [1.회원정보]을 참조하고 참조 무결성을 유지한다.

DROP TABLE NOTICE_INFO purge;

CREATE TABLE NOTICE_INFO(
	ID       			VARCHAR2(20)   	NOT NULL,    --아이디
	NOTICE_NUM       	NUMBER(3)    	NOT NULL,    --공지사항 번호
    NOTICE_SUBJECT      VARCHAR2(300)   NOT NULL,    --공지사항 제목
    NOTICE_CONTENT      VARCHAR2(4000)	NOT NULL,    --공지사항 내용
    NOTICE_FILE     	VARCHAR2(50),    			 --공지사항 업로드 이미지
    NOTICE_DATE   		DATE 	 default sysdate,    --공지사항 작성 날짜(insert시 자동 날짜 입력됨)
    FOREIGN KEY(ID) REFERENCES USER_INFO(ID) on delete cascade,
    PRIMARY KEY(ID)
);

