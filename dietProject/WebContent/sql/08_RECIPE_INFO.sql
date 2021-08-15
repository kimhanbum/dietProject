--���� : ������ ������ �� �� �ֽ��ϴ�.
--1.RECIPE_DATE�� YYYY/mm/dd �������� �����Ѵ�.
--2.ID�� FK�ν�, [1.ȸ������]�� �����ϰ� ���� ���Ἲ�� �����Ѵ�.
--RECIPE_NUM       	NUMBER(3)    	NOT NULL,    --������ ��ȣ
DROP TABLE RECIPE_INFO cascade constraints purge;

CREATE TABLE RECIPE_INFO(
	ID       			VARCHAR2(20)   	NOT NULL,    --���̵�
	RECIPE_CODE       	VARCHAR2(4)    	NOT NULL,    --�������ڵ�
    RECIPE_SUBJECT      VARCHAR2(300)   NOT NULL,    --������ ����
    RECIPE_CONTENT      VARCHAR2(4000)	NOT NULL,    --������ ����
    RECIPE_SUMMARY      VARCHAR2(300),    			 --������ Ư¡
    RECIPE_FILE     	VARCHAR2(50),    			 --������ �̹���
    RECIPE_DATE   		DATE 	 default sysdate,    --������ �ۼ� ��¥(insert�� �ڵ� ��¥ �Էµ�)
    FOREIGN KEY(ID) REFERENCES USER_INFO(ID) on delete cascade,
    PRIMARY KEY(RECIPE_CODE)
);

