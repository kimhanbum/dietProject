--���� : ��ü ���� ����(������,���,�Ĵ�[��¥�� Ȯ�ΰ���])�� �� �� �ֽ��ϴ�.
--1.TOTAL_DATE�� YYYY/mm/dd �������� �����Ѵ�.
--2.ID�� FK�ν�, [1.ȸ������]�� �����ϰ� ���� ���Ἲ�� �����Ѵ�.
--3.���� ���� Į�θ��� �̿��� ���� �����(g) ���
-- 1)ź��ȭ�� , �ܹ��� :  [���� ���� Į�θ�] x 0.25 / 4 (�ش� ������� �Ҽ��� ����)
-- 2)���� :  [���� ���� Į�θ�] x 0.25 / 9 (�ش� ������� �Ҽ��� ����)


DROP TABLE TOTAL_INFO purge;

CREATE TABLE TOTAL_INFO(
	ID                  VARCHAR2(20)   NOT NULL,    --���̵�
	TOTAL_BF            VARCHAR2(4),    	        --���� ��ħ �Ĵ�
	TOTAL_LUNCH         VARCHAR2(4),        		--���� ���� �Ĵ�
    TOTAL_DINNER        VARCHAR2(4),        		--���� ���� �Ĵ�
    TOTAL_SNACK         VARCHAR2(4), 		   		--���� ���� ����
    TOTAL_WATER         NUMBER(2),	 	   			--���� �����뷮
    TOTAL_WEIGHT        NUMBER(3),	 	    		--���� ü��
    TOTAL_WORKOUT       VARCHAR2(40),	 	        --���� ���
    TOTAL_CARB          NUMBER(3),	 	    		--���� �� ���� ź��ȭ�� g
    TOTAL_FAT           NUMBER(3),	 	    		--���� �� ���� ���� g
    TOTAL_PROTEIN       NUMBER(3),	 	    		--���� �� ���� �ܹ��� g
    TOTAL_CAL           NUMBER(4),	 	    		--���� �� ���� Į�θ�
	TOTAL_DATE          DATE     default sysdate,   --���� ���� ��¥(insert�� �ڵ� ��¥ �Էµ�)
    FOREIGN KEY(ID) REFERENCES USER_INFO(ID) on delete cascade,
    PRIMARY KEY(ID)
);

