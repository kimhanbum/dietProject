--���� : �Ĵܿ� �޸� ��� ������ �� �� �ֽ��ϴ�.
--1.DIET_CODE�� �˸� �Ĵ� ������ �Ĵ����̺��� �� �� �ִ�.
--2.DIET_CODE�� FK�ν�, [4.�Ĵ�]�� �����ϰ� ���� ���Ἲ�� �����Ѵ�.
--3.ID�� FK�ν� , [1.ȸ������]�� �����ϰ� ���� ���Ἲ�� �����Ѵ�.
--4.DIET_RE_CONTENT�� 50��(�ѱ۱���)���ܷ� �����Ѵ�.

DROP TABLE DIET_REPLY purge;

CREATE TABLE DIET_REPLY(
	ID       			VARCHAR2(20)   	NOT NULL,    --���̵�
	DIET_CODE       	VARCHAR2(4)    	NOT NULL,    --�Ĵ��ڵ�
	DIET_RE_NUM       	NUMBER(3)       NOT NULL,    --�Ĵ� ��� ��ȣ
	DIET_RE_SEQ       	NUMBER(3)       NOT NULL,    --�Ĵ� ��� ����
    DIET_RE_CONTENT     VARCHAR2(160)   NOT NULL,    --�Ĵ� ��� ����
    DIET_RE_DATE   		DATE 	 default sysdate,    --��� �ۼ� ��¥(insert�� �ڵ� ��¥ �Էµ�)
    FOREIGN KEY(ID) REFERENCES USER_INFO(ID) on delete cascade,
    FOREIGN KEY(DIET_CODE) REFERENCES DIET_INFO(DIET_CODE) on delete cascade,
    PRIMARY KEY(DIET_RE_NUM)
);

