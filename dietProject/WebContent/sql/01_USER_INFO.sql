--설명 : 가입한 유저의 정보를 알 수 있습니다
--1.ID는 7~20자 내외로 지정한다.
--2.PASS는 7~20자 내외로 지정한다.
--3.BIRTH는 YYYY/mm/dd 형식으로 저장한다.
--4.이메일 입력 양식은 추후 구체적 지정 예정
--5.전화번호 입려 양식은 추후 구체적 지정 예정

--ID가 외래키 참조되므로 table 삭제시 cascade constraints 옵션 
DROP TABLE USER_INFO cascade constraints purge;

CREATE TABLE USER_INFO(
    ID           VARCHAR2(20)  NOT NULL,         
    PASS         VARCHAR2(20)  NOT NULL,   
    NAME         VARCHAR2(12)  NOT NULL,   
    BIRTH        DATE 		   NOT NULL,  
    GENDER       VARCHAR2(3)   NOT NULL, 
    EMAIL        VARCHAR2(30)  NOT NULL,  
    TEL          VARCHAR2(13)  NOT NULL,  
    ADDRESS		 VARCHAR2(200) NOT NULL,
    PRIMARY KEY(ID)
);

