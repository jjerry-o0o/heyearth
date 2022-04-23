
# 상시 미션 추가
insert into mission values (211, 'solo','텀블러 사용하기',  '어디서나', '2022-12-31', '카페에서 일회용품 대신 텀블러 사용하기', 70,500, 1, 'eco.jpg');
insert into mission values (221,'solo', '분리배출 하기'	,  '어디서나', '2022-12-31', '올바른 분리배출 방법으로 재활용품 버리기'	, 202, 500,	1, 'eco.jpg');
insert into mission values (231,  'solo', '용기내 챌린지'	,'어디서나', '2022-12-31', '다회용 용기에 구매한 음식 담아오기', 70, 500, 1, 'eco.jpg');
insert into mission values (241,  'solo'	,'탄소포인트제' , '어디서나', '2022-12-31', '온실가스 발생을 줄이는 탄소포인트제 시행하기',	 90, 500, 1, 'eco.jpg');
insert into mission values (251,  'solo','중고 거래 동참	',	'어디서나', '2022-12-31', '필요한 물건, 새상품 구매 대신 중고거래 동참하기', 83, 500, 1, 'eco.jpg');
insert into mission values (261, 'solo','재활용 포장재 반납하기', '어디서나', '2022-12-31', '물건이나 배달음식 구매한 뒤 재활용 포장재 매장에 반납하기', 70, 500, 1, 'eco.jpg');
insert into mission values (271, 'solo','어디서나','채식하기', '2022-12-31', '육식대신 채식을 통해 탄소배출량 줄이기', 200, 500, 1, 'eco.jpg');

# 컬럼 수정
ALTER TABLE participation ADD COLUMN p_friends INTEGER not null;
ALTER TABLE participation drop COLUMN p_code;
ALTER TABLE participation ADD COLUMN p_code INTEGER not null auto_increment PRIMARY KEY first;
    
# 단체미션 추가
insert into mission values (111,'group','플러깅','여의도공원','2022-04-30','걸으면서 쓰레기 줍줍하는 \'플로깅\' 도전하기', 301, 1000, 30, 'plogging.jpg');
insert into mission values (121,'group','해양 쓰레기 줍기','해운대','2022-05-15','직접 해변에 방치된 쓰레기를 주우며 건강한 바다 만나기',  357, 1000, 20, 'seawaste.jpg');
insert into mission values (131,'group','업사이클링 클래스 참여','성수동 헤이공방','2022-06-13','재생가죽으로 파우치 만들기',  200, 1000, 10, 'upcycling.png');





/*테이블 수정*/
alter table zeroshop modify s_hour varchar(100) null;
alter table location drop latitude;
alter table location drop longitude;
alter table zeroshop add latitude decimal(10,7) null;
alter table zeroshop add longitude decimal(11,7) null;
SET FOREIGN_KEY_CHECKS = 0;
alter table location modify l_code int not null auto_increment;
SET FOREIGN_KEY_CHECKS = 1;
alter table zeroshop modify s_code int not null auto_increment;


