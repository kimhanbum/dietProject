--���� : ���� ����(Ű/ü��/��ǥ)�� �� ��  �ֽ��ϴ�.
--1.ID�� FK�ν�, [1.ȸ������]�� �����ϰ� ���� ���Ἲ�� �����Ѵ�.
--2.ID�� �˸� ȸ�������� ȸ������ ���̺��� �� �� �ִ�.
--3.HEIGHT�� 40~240���ܷ� �����Ѵ�.
--4.WEIGHT�� 40~200���ܷ� �����Ѵ�. 
--5.RMR�� ������ �������� ���̺��� HEIGHT/WEIGHT/GOAL �� ȸ�� ���� ���̺��� GENDER/BIRTH�� �̿��� ���� �Էµȴ�.
-- (���� ��緮 ����� �Ʒ��� ���� GOAL�� ���� +300Kcal , - 300Kcal�� �߰� ���� �ȴ�.)
-- ��)66.47+(13.75 x ü��) + (5 x Ű) - (6.76 x ����)
-- ��)665.1 + (9.56 x ü��) + (1.85 x Ű) - (4.68 x ����)

DROP TABLE PERSONAL_INFO purge;

CREATE TABLE PERSONAL_INFO(
    ID       		VARCHAR2(20) 	NOT NULL,    
    GOAL     		NUMBER(1) 		NOT NULL,   --��ǥ(ü�߰���/����/����
    HEIGHT      	NUMBER(3)		NOT NULL,   --Ű 
    WEIGHT      	NUMBER(3)		NOT NULL,   --������
    GOAL_WEIGHT  	NUMBER(3)		NOT NULL,   --��ǥ ����
    RMR        		NUMBER(4)		NOT NULL,   --���ʴ�緮
    FOREIGN KEY(ID) REFERENCES USER_INFO(ID) on delete cascade,
    PRIMARY KEY(ID)
);

