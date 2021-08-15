--���� : ������ �Ĵ��� ������ �� �� �ֽ��ϴ�.
--1.DIET_DATE�� YYYY/mm/dd �������� �����Ѵ�.
--2.DIET_CODE��  �� ���ڸ��� D 1�ڸ�, ������ ��ȣ�� ���ļ� �����մϴ�.
--3.ID�� FK�ν�, [1.ȸ������]�� �����ϰ� ���� ���Ἲ�� �����Ѵ�.

DROP TABLE DIET_INFO cascade constraints purge;

CREATE TABLE DIET_INFO(
	ID       			VARCHAR2(20)   	NOT NULL,    --���̵�
	DIET_CODE       	VARCHAR2(4)    	NOT NULL,    --�Ĵ��ڵ�
	DIET_NAME       	VARCHAR2(30)    NOT NULL,    --�Ĵ��̸�
    DIET_FORM       	VARCHAR2(90)    NOT NULL,    --����������
    DIET_SHARE     		NUMBER(1) 		NOT NULL,    --�Ĵ� ���� ����
    DIET_RECOMM       	NUMBER(3)	 	NOT NULL,    --��õ��
    DIET_TOTAL_CARB     NUMBER(3)	 	NOT NULL,    --�Ĵ� �� ź�� g
    DIET_TOTAL_FAT  	NUMBER(3)	 	NOT NULL,    --�Ĵ� �� ���� g
    DIET_TOTAL_PROTEIN  NUMBER(3)	 	NOT NULL,    --�Ĵ� �� �ܹ� g
    DIET_TOTAL_CAL      NUMBER(4)	 	NOT NULL,    --�Ĵ� �� Į�θ�
    DIET_DATE   		DATE 	 default sysdate,    --�Ĵ� �ۼ� ��¥(insert�� �ڵ� ��¥ �Էµ�)
    FOREIGN KEY(ID) REFERENCES USER_INFO(ID) on delete cascade,
    PRIMARY KEY(DIET_CODE)
);


drop sequence diet_seq;
  
--�������� �����մϴ�. 
create sequence diet_seq;
