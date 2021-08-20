DROP TABLE CART_INFO cascade constraints purge;

CREATE TABLE CART_INFO(
 	CART_NUM     NUMBER(3)     NOT NULL,
    ID           VARCHAR2(20)  NOT NULL,         
    CART_CODE    VARCHAR2(4)  NOT NULL,  
    PRIMARY KEY(CART_NUM)
);

