DROP TABLE TOTAL_INFO purge;

CREATE TABLE TOTAL_INFO(
	ID                  VARCHAR2(20)   NOT NULL,
	TOTAL_BF            VARCHAR2(4),    	        
	TOTAL_LUNCH         VARCHAR2(4),        		
    TOTAL_DINNER        VARCHAR2(4),        		
    TOTAL_SNACK         VARCHAR2(4), 		   		
    TOTAL_WATER         NUMBER(2),	 	   			
    TOTAL_WEIGHT        NUMBER(3),	 	    		
    TOTAL_WORKOUT       VARCHAR2(40),	 	        
    TOTAL_CARB          NUMBER(3),	 	    		
    TOTAL_FAT           NUMBER(3),	 	    		
    TOTAL_PROTEIN       NUMBER(3),	 	    		
    TOTAL_CAL           NUMBER(4),	 	    		
	TOTAL_DATE          DATE     default sysdate,   
	TOTAL_NUM           NUMBER(3)       NOT NULL,
    FOREIGN KEY(ID) REFERENCES USER_INFO(ID) on delete cascade,
    PRIMARY KEY(TOTAL_NUM)
);

