--���� : �����ǿ� �޸� ��� ������ �� �� �ֽ��ϴ�.
--1.RECIPE�� �˸� ������ ������ ���������̺��� �� �� �ִ�.
--2.RECIPE_CODE�� FK�ν�, [8.������]�� �����ϰ� ���� ���Ἲ�� �����Ѵ�.
--3.ID�� FK�ν� , [1.ȸ������]�� �����ϰ� ���� ���Ἲ�� �����Ѵ�.
--4.RECIPE_RE_CONTENT�� 50��(�ѱ۱���)���ܷ� �����Ѵ�.

DROP TABLE RECIPE_REPLY purge;

CREATE TABLE RECIPE_REPLY(
	ID       			VARCHAR2(20)   	NOT NULL,    --���̵�
	RECIPE_CODE       	VARCHAR2(4)    	NOT NULL,    --������ �ڵ�
	RECIPE_RE_NUM       NUMBER(3)    	NOT NULL,    --������ ��� ��ȣ
	RECIPE_RE_SEQ       NUMBER(3)       NOT NULL,    --������ ��� ����
    RECIPE_RE_CONTENT   VARCHAR2(160)   NOT NULL,    --������ ��� ����
    RECIPE_RE_DATE   	DATE 	 default sysdate,    --��� �ۼ� ��¥(insert�� �ڵ� ��¥ �Էµ�)
    FOREIGN KEY(ID) REFERENCES USER_INFO(ID) on delete cascade,
    FOREIGN KEY(RECIPE_CODE) REFERENCES RECIPE_INFO(RECIPE_CODE) on delete cascade,
    PRIMARY KEY(RECIPE_RE_NUM)
);

