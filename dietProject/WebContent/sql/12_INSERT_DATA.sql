--이름,탄수화물,지방,단백질,칼로리,종류1(음식타입),종류2(영양소타입)
--1.채소 
insert into FOOD_INFO values(food_seq.nextval,'감자','potato',16,0,2,70,1,1);
insert into FOOD_INFO values(food_seq.nextval,'고구마','sweetPotato',26,0,2,112,1,1);
insert into FOOD_INFO values(food_seq.nextval,'브로콜리','broccoli',7,0,3,34,1,1);
insert into FOOD_INFO values(food_seq.nextval,'샐러리','celery',1,0,0,6,1,1);
insert into FOOD_INFO values(food_seq.nextval,'아스파라거스','asparagus',1,0,0,4,1,1);
insert into FOOD_INFO values(food_seq.nextval,'오이','cucumber',11,0,2,45,1,1);
insert into FOOD_INFO values(food_seq.nextval,'토마토','tomato',5,0,1,22,1,1);
insert into FOOD_INFO values(food_seq.nextval,'올리브','olive',1,0,0,5,1,1);
insert into FOOD_INFO values(food_seq.nextval,'당근','carrot',10,0,1,41,1,1);
insert into FOOD_INFO values(food_seq.nextval,'버섯','mushroom',3,0,3,22,1,1);

--2.과일
insert into FOOD_INFO values(food_seq.nextval,'딸기','strawberry',60,0,1,222,2,1);
insert into FOOD_INFO values(food_seq.nextval,'바나나','banana',27,0,1,105,2,1);
insert into FOOD_INFO values(food_seq.nextval,'사과','apple',19,0,0,72,2,1);
insert into FOOD_INFO values(food_seq.nextval,'오렌지','orange',15,0,1,62,2,1);
insert into FOOD_INFO values(food_seq.nextval,'블루베리','blueberries',21,1,1,83,2,1);
insert into FOOD_INFO values(food_seq.nextval,'포도','grape',15,0,1,62,2,1);
insert into FOOD_INFO values(food_seq.nextval,'복숭아','peach',36,0,1,136,2,1);
insert into FOOD_INFO values(food_seq.nextval,'아보카도','avocado',17,29,4,322,2,2);
insert into FOOD_INFO values(food_seq.nextval,'키위','kiwi',11,1,1,46,2,1);
insert into FOOD_INFO values(food_seq.nextval,'배','pear',25,0,1,96,2,1);

--3.어류
insert into FOOD_INFO values(food_seq.nextval,'고등어','mackerel',0,9,20,167,3,3);
insert into FOOD_INFO values(food_seq.nextval,'연어','salmon',0,6,22,146,3,3);
insert into FOOD_INFO values(food_seq.nextval,'참치','tuna',0,5,23,144,3,3);
insert into FOOD_INFO values(food_seq.nextval,'청어','herring',0,14,16,195,3,3);
insert into FOOD_INFO values(food_seq.nextval,'멸치','anchovy',0,5,20,131,3,3);
insert into FOOD_INFO values(food_seq.nextval,'대구','cod',8,11,19,211,3,3);
insert into FOOD_INFO values(food_seq.nextval,'메기','catfish',9,15,18,240,3,3);
insert into FOOD_INFO values(food_seq.nextval,'도미','bream',0,3,44,218,3,3);
insert into FOOD_INFO values(food_seq.nextval,'황새치','swordfish',1,8,23,177,3,3);
insert into FOOD_INFO values(food_seq.nextval,'넙치','halibut',0,2,21,110,3,3);

--4.육류
insert into FOOD_INFO values(food_seq.nextval,'돼지앞다리','pork_forelimbs',0,12,16,182,4,3);
insert into FOOD_INFO values(food_seq.nextval,'돼지뒷다리','pork_hindleg',0,19,17,245,4,2);
insert into FOOD_INFO values(food_seq.nextval,'돼지목살','pork_neck',0,19,2,269,4,3);
insert into FOOD_INFO values(food_seq.nextval,'닭다리','chicken_leg',0,9,19,156,4,3);
insert into FOOD_INFO values(food_seq.nextval,'닭가슴살','chicken_breast',0,1,23,109,4,3);
insert into FOOD_INFO values(food_seq.nextval,'소등심','beef_sirloin',0,14,20,214,4,3);
insert into FOOD_INFO values(food_seq.nextval,'소안심','beef_tenderloin',0,9,21,169,4,3);

--5.해조류
insert into FOOD_INFO values(food_seq.nextval,'바지락','bagirak',2,1,12,67,5,3);
insert into FOOD_INFO values(food_seq.nextval,'관자','scallop',2,1,20,106,5,3);
insert into FOOD_INFO values(food_seq.nextval,'키조개','key_clam',1,1,11,57,5,3);
insert into FOOD_INFO values(food_seq.nextval,'새조개','sea_clam',1,2,21,110,5,3);
insert into FOOD_INFO values(food_seq.nextval,'미역','seaweed',10,1,3,45,5,1);
insert into FOOD_INFO values(food_seq.nextval,'김','dry_seaweed',5,0,6,34,5,3);
insert into FOOD_INFO values(food_seq.nextval,'톳','ttot',5,0,1,24,5,1);
insert into FOOD_INFO values(food_seq.nextval,'파래','pare',3,0,2,11,5,1);

--6.견과류
insert into FOOD_INFO values(food_seq.nextval,'밤','chestnut',7,0,4,16,6,1);
insert into FOOD_INFO values(food_seq.nextval,'땅콩','peanut ',0,2,1,11,6,2);
insert into FOOD_INFO values(food_seq.nextval,'호두','walnut',1,3,1,26,6,2);
insert into FOOD_INFO values(food_seq.nextval,'아몬드','almond',0,1,0,7,6,2);
insert into FOOD_INFO values(food_seq.nextval,'잣','pine_nut',0,2,1,12,6,2);
insert into FOOD_INFO values(food_seq.nextval,'피스타치오','pistachio',1,1,0,4,6,2);
insert into FOOD_INFO values(food_seq.nextval,'해바라기씨','sunflower_seed',0,1,0,10,6,2);
insert into FOOD_INFO values(food_seq.nextval,'피칸','pecan',0,2,0,12,6,2);

--1.기성식단
insert into MEAL_INFO values('M1','김치찌개',2,3,3,52);
insert into MEAL_INFO values('M2','김치볶음밥',8,1,1,138);
insert into MEAL_INFO values('M3','돈까스',6,4,3,82);
insert into MEAL_INFO values('M4','햄버거',25,5,15,306);
insert into MEAL_INFO values('M5','된장찌개',5,4,4,70);
insert into MEAL_INFO values('M6','제육볶음',17,19,12,280);
insert into MEAL_INFO values('M7','물냉면',14,1,2,69);
insert into MEAL_INFO values('M8','비빔냉면',22,1,3,114);
insert into MEAL_INFO values('M9','피자',110,18,17,357);
insert into MEAL_INFO values('M10','콩국수',13,6,10,181);
insert into MEAL_INFO values('M11','순두부찌개',7,4,1,97);
insert into MEAL_INFO values('M12','해물볶음밥',31,2,4,162);
insert into MEAL_INFO values('M13','만두',17,9,10,180);
insert into MEAL_INFO values('M14','파스타',69,2,14,325);
insert into MEAL_INFO values('M15','탕수육',21,6,6,260);
insert into MEAL_INFO values('M16','짜장면',42,12,7,312);
insert into MEAL_INFO values('M17','짬뽕',62,13,11,230);
insert into MEAL_INFO values('M18','돼지갈비',4,15,28,293);
insert into MEAL_INFO values('M19','소불고기',4,7,13,130);
insert into MEAL_INFO values('M20','닭갈비',6,5,10,115);
insert into MEAL_INFO values('M21','해물칼국수',31,2,1,70);

--2.간식
insert into MEAL_INFO values('M22','떡볶이',30,4,2,150);
insert into MEAL_INFO values('M23','순대',28,3,7,122);
insert into MEAL_INFO values('M24','튀김',24,12,18,308);
insert into MEAL_INFO values('M25','생크림케익',20,18,4,257);
insert into MEAL_INFO values('M26','티라미슈',20,19,6,261);
insert into MEAL_INFO values('M27','머핀',26,1,5,132);
insert into MEAL_INFO values('M28','브라우니',21,4,1,129);
insert into MEAL_INFO values('M29','치즈케이크',20,18,4,257);
insert into MEAL_INFO values('M30','쿠키',3,1,1,24);
insert into MEAL_INFO values('M31','와플',19,4,3,121);
insert into MEAL_INFO values('M32','다크초콜릿',24,14,2,207);
insert into MEAL_INFO values('M33','마늘빵',7,2,1,53);
insert into MEAL_INFO values('M34','푸딩',24,4,2,140);
insert into MEAL_INFO values('M35','아이스크림',32,14,4,267);
insert into MEAL_INFO values('M36','감자칩',45,33,6,835);
insert into MEAL_INFO values('M37','애플파이',57,19,3,411);
insert into MEAL_INFO values('M38','우유',4,4,3,65);
insert into MEAL_INFO values('M39','샌드위치',71,21,5,500);
insert into MEAL_INFO values('M40','요거트',4,0,10,55);
insert into MEAL_INFO values('M41','핫도그',27,11,7,235);




--초기 입력값 

--admin 계정 생성
insert into USER_INFO values('admin01','admin01','admin01',sysdate,'남','admin01@naver.com','010-1111-2222','경기도 수원시');
insert into USER_INFO values('admin02','admin02','admin02',sysdate,'여','admin02@naver.com','010-3333-4444','경기도 하남시');
insert into USER_INFO values('admin03','admin03','admin03',sysdate,'남','admin03@naver.com','010-5555-6666','경기도 안양시');

--유저 계정 생성
insert into USER_INFO values('user001','user001','user001',sysdate,'여','user01@naver.com','010-1234-4321','서울시 강남구');
insert into USER_INFO values('user002','user002','user002',sysdate,'남','user02@naver.com','010-5678-8765','서울시 마포구');
insert into USER_INFO values('user003','user003','user003',sysdate,'남','user03@naver.com','010-7788-8899','서울시 서초구');

--유저 개인정보
insert into PERSONAL_INFO values('user001',1,170,60,50,2400);
insert into PERSONAL_INFO values('user002',2,180,60,60,2500);
insert into PERSONAL_INFO values('user003',3,190,60,65,2600);

--식단 추가
insert into DIET_INFO values('user001','D1','채소위주','1,2,3,4',0,0,10,20,30,300,sysdate);
insert into DIET_INFO values('user002','D2','과일위주','11,12,13,14',0,0,20,30,10,310,sysdate);
insert into DIET_INFO values('user003','D3','어류위주','21,22,23,24',0,0,30,20,10,320,sysdate);

--식단 댓글
insert into DIET_REPLY values('user001','D2',1,1,'과일이 좋습니다',sysdate);
insert into DIET_REPLY values('user002','D3',2,1,'어류가 좋습니다',sysdate);
insert into DIET_REPLY values('user003','D1',3,1,'채소가 좋습니다',sysdate);

--전체 정보 
insert into TOTAL_INFO values('user001','D1','D2','D3','M22',5,45,'러닝1시간',60,60,60,930,sysdate);
insert into TOTAL_INFO values('user002','M1','M2','D2','M23',4,50,'자전거1시간',70,70,70,1000,sysdate);
insert into TOTAL_INFO values('user003','M1','M2','D1','M24',3,55,'헬스1시간',80,80,80,1120,sysdate);

--레시피
insert into RECIPE_INFO values('user001','1','제육볶음','고기를 고추장에 볶음','달달하게만듬','gogi1.png',sysdate);
insert into RECIPE_INFO values('user002','2','소불고기','고기를 간장에 볶음','짭잘하게만듬','gogi2.png',sysdate);
insert into RECIPE_INFO values('user003','3','큐브스테이크','고기를 스테이크소스에 볶음','맛있게만듬','gogi3.png',sysdate);

--레시피 댓글
insert into RECIPE_REPLY values('user001','2',1,1,'불고기 좋습니다',sysdate);
insert into RECIPE_REPLY values('user002','3',2,1,'스테이크 좋습니다',sysdate);
insert into RECIPE_REPLY values('user003','1',3,1,'제육이 좋습니다',sysdate);

--공지사항
insert into NOTICE_INFO values('admin01',1,'공지입니다.','홈페이가 오픈했습니다.','notice.png',sysdate);

--문의사항
insert into QUESTION_INFO values('user002',1,'문의사항이 있습니다.','식단작성방법이 어떻게되나요',sysdate,1,0,0);
insert into QUESTION_INFO values('admin01',2,'re:문의사항이 있습니다.','식단작성항목으로가세요',sysdate,1,1,1);









