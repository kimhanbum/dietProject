--설명 : 전체 관리 정보(물섭취,운동량,식단[날짜별 확인가능])를 알 수 있습니다.
--1.TOTAL_DATE는 YYYY/mm/dd 형식으로 저장한다.
--2.ID는 FK로써, [1.회원정보]을 참조하고 참조 무결성을 유지한다.
--3.일일 권장 칼로리를 이용해 일일 영양소(g) 계산
-- 1)탄수화물 , 단백질 :  [일일 권장 칼로리] x 0.25 / 4 (해당 결과값의 소수점 버림)
-- 2)지방 :  [일일 권장 칼로리] x 0.25 / 9 (해당 결과값의 소수점 버림)


DROP TABLE TOTAL_INFO purge;

CREATE TABLE TOTAL_INFO(
	ID                  VARCHAR2(20)   NOT NULL,    --아이디
	TOTAL_BF            VARCHAR2(4),    	        --당일 아침 식단
	TOTAL_LUNCH         VARCHAR2(4),        		--당일 점심 식단
    TOTAL_DINNER        VARCHAR2(4),        		--당일 저녁 식단
    TOTAL_SNACK         VARCHAR2(4), 		   		--당일 섭취 간식
    TOTAL_WATER         NUMBER(2),	 	   			--당일 물섭취량
    TOTAL_WEIGHT        NUMBER(3),	 	    		--당일 체중
    TOTAL_WORKOUT       VARCHAR2(40),	 	        --당일 운동량
    TOTAL_CARB          NUMBER(3),	 	    		--당일 총 섭취 탄수화물 g
    TOTAL_FAT           NUMBER(3),	 	    		--당일 총 섭취 지방 g
    TOTAL_PROTEIN       NUMBER(3),	 	    		--당일 총 섭취 단백질 g
    TOTAL_CAL           NUMBER(4),	 	    		--당일 총 섭취 칼로리
	TOTAL_DATE          DATE     default sysdate,   --관리 정보 날짜(insert시 자동 날짜 입력됨)
    FOREIGN KEY(ID) REFERENCES USER_INFO(ID) on delete cascade,
    PRIMARY KEY(ID)
);

