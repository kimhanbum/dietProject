--���� : ������ ������ ������ �� �� �ֽ��ϴ�
--1.ID�� 7~20�� ���ܷ� �����Ѵ�.
--2.PASS�� 7~20�� ���ܷ� �����Ѵ�.
--3.BIRTH�� YYYY/mm/dd �������� �����Ѵ�.
--4.�̸��� �Է� ����� ���� ��ü�� ���� ����
--5.��ȭ��ȣ �Է� ����� ���� ��ü�� ���� ����

--ID�� �ܷ�Ű �����ǹǷ� table ������ cascade constraints �ɼ� 
DROP TABLE USER_INFO cascade constraints purge;

CREATE TABLE USER_INFO(
    ID           VARCHAR2(20)  NOT NULL,         
    PASS         VARCHAR2(20)  NOT NULL,   
    NAME         VARCHAR2(12)  NOT NULL,     
    JUMIN        VARCHAR2(14)  NOT NULL,
    GENDER       VARCHAR2(3)   NOT NULL, 
    EMAIL        VARCHAR2(30)  NOT NULL,  
    TEL          VARCHAR2(13)  NOT NULL,  
    ADDRESS		 VARCHAR2(200) NOT NULL,
    PRIMARY KEY(ID)
);

