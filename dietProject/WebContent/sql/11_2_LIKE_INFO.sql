DROP TABLE LIKE_INFO cascade constraints purge;

CREATE TABLE LIKE_INFO(
 	LIKE_NUM     NUMBER(3)     NOT NULL,
    ID           VARCHAR2(20)  NOT NULL,         
    LIKE_CODE    VARCHAR2(4)  NOT NULL,  
    PRIMARY KEY(LIKE_NUM)
);

