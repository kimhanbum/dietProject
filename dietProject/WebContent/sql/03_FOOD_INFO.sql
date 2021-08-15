--���� :������ ������ �� ��  �ֽ��ϴ�.

DROP TABLE FOOD_INFO purge;

CREATE TABLE FOOD_INFO(
    FOOD_CODE       NUMBER(3)    NOT NULL,    --�������ڵ�
    FOOD_NAME     	VARCHAR2(30) NOT NULL,    --�������̸�
    FOOD_CARB       NUMBER(3)	 NOT NULL,    --ź��ȭ�� g��
    FOOD_FAT      	NUMBER(3)	 NOT NULL,    --���� g��
    FOOD_PROTEIN  	NUMBER(3)	 NOT NULL,    --�ܹ��� g��
    FOOD_CAL        NUMBER(4)	 NOT NULL,    --������ Į�θ�
    FOOD_TYPE       NUMBER(2)	 NOT NULL,    --���� Ÿ��(1.ä�� 2.���� 3.��� 4.���� 5.������ 6.�߰���)
    NUTRIENT_TYPE   NUMBER(1)	 NOT NULL,    --����� Ÿ��(1.ź������ 2.�ܹ����� 3.��������)
    PRIMARY KEY(FOOD_CODE)
);


drop sequence food_seq;
  
--�������� �����մϴ�. 
create sequence food_seq;






