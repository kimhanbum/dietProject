--���� : �������� ������ �� �� �ֽ��ϴ�.
--1.NOTICE_DATE�� YYYY/mm/dd �������� �����Ѵ�.
--2.ID�� FK�ν�, [1.ȸ������]�� �����ϰ� ���� ���Ἲ�� �����Ѵ�.

DROP TABLE NOTICE_INFO purge;

CREATE TABLE NOTICE_INFO(
	ID       			VARCHAR2(20)   	NOT NULL,    --���̵�
	NOTICE_NUM       	NUMBER(3)    	NOT NULL,    --�������� ��ȣ
    NOTICE_SUBJECT      VARCHAR2(300)   NOT NULL,    --�������� ����
    NOTICE_CONTENT      VARCHAR2(4000)	NOT NULL,    --�������� ����
    NOTICE_FILE     	VARCHAR2(50),    			 --�������� ���ε� �̹���
    NOTICE_DATE   		DATE 	 default sysdate,    --�������� �ۼ� ��¥(insert�� �ڵ� ��¥ �Էµ�)
    FOREIGN KEY(ID) REFERENCES USER_INFO(ID) on delete cascade,
    PRIMARY KEY(ID)
);

