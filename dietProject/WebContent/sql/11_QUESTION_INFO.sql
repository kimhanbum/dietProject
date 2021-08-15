--���� : ���ǻ��� ������ �� �� �ֽ��ϴ�.
--1.QUESTION_DATE�� YYYY/mm/dd �������� �����Ѵ�.
--2.ID�� FK�ν�, [1.ȸ������]�� �����ϰ� ���� ���Ἲ�� �����Ѵ�.

DROP TABLE QUESTION_INFO purge;

CREATE TABLE QUESTION_INFO(
    ID           		VARCHAR2(20) 	 NOT NULL,  --���̵�   
    QUESTION_NUM        NUMBER(3)   	 NOT NULL,	--���� ���� ��ȣ
    QUESTION_SUBJECT    VARCHAR2(300)    NOT NULL,	--���� ���� ����
    QUESTION_CONTENT    VARCHAR2(4000)   NOT NULL,	--���� ���� ����
    QUESTION_DATE       DATE default sysdate,  		--���� ���� �ۼ� ��¥(INSERT�� �ڵ� �Է�)
    QUESTION_RE_REF     NUMBER(3),  				--��ۿ�  �ش�Ǵ� ���� ���� ��ȣ
    QUESTION_RE_LEV     NUMBER(1),      			--��� ����
    QUESTION_SEQ        NUMBER(1),       			--��� ����
    FOREIGN KEY(ID) REFERENCES USER_INFO(ID) on delete cascade,
    PRIMARY KEY(QUESTION_NUM)
);







