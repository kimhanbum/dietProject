--���� : �⼺�Ĵ�/���� ������ �� ��  �ֽ��ϴ�.
--1.MEAL_CODE��  �� ���ڸ��� M 1�ڸ�, ������ ��ȣ�� ���ļ� �����մϴ�.

DROP TABLE MEAL_INFO purge;

CREATE TABLE MEAL_INFO(
	MEAL_CODE      VARCHAR2(4)    	NOT NULL,    --�⼺�Ĵ� �ڵ�
	MEAL_NAME      VARCHAR2(30)     NOT NULL,    --�⼺�Ĵ� �̸�
	MEAL_IMG_NAME  VARCHAR2(30)     NOT NULL,    --�⼺�Ĵ� �̸�
    MEAL_CARB      NUMBER(3)	 	NOT NULL,    --�⼺�Ĵ� ź�� g
    MEAL_FAT  	   NUMBER(3)	 	NOT NULL,    --�⼺�Ĵ� ���� g
    MEAL_PROTEIN   NUMBER(3)	 	NOT NULL,    --�⼺�Ĵ� �ܹ� g
    MEALL_CAL      NUMBER(4)	 	NOT NULL,    --�⼺�Ĵ� �� Į�θ�
    PRIMARY KEY(MEAL_CODE)
);

