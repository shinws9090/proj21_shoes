select * from product;

-- 권한 , 직원정보 , 공지사항
insert into authority values
(1,'권한'),
(2,'임시');


insert into employee values
	(101,'신범건',1,'shinws9090','rootroot','shinws9090@naver.com','010-1111-123'),
	(202,'이민정',1,'minruki','rootroot','minruki51@gmail.com','010-7777-7777'),
	(303,'김길현',1,'tizona','rootroot',' tizona@naver.com','010-2345-6789'),
	(404,'김예진',1,'chamdodari','rootroot','chamdodari@naver.com','010-1010-2020'),
	(505,'신입',2,'test',password('123'),'test@test.co.kr','010-0000-0000');

insert into notice values
	(1,101,'교환 및 반품 안내사항','★꼭 읽어주세요★',now()),
	(2,101,'적립금 소멸 안내','유효기간 만료 미사용 적립금 소멸 안내',now()),
	(3,101,'카드사별 무이자 할인 혜택','카드사 무이자 할부, 부분 무이자 할부',now()),
	(4,101,'일주일동안, 위클리 세일!','BEST 상품만 최대 90% SALE',now()),
	(5,101,'카카오 알림톡 & 실시간 서비스','<p><span style="font-size: 15px; letter-spacing: -0.75px;">안녕하세요.</span><br style="font-size: 15px; letter-spacing: -0.75px;"><span style="font-size: 15px; letter-spacing: -0.75px;">포인트 정책이&nbsp;</span><span style="border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 15px; line-height: inherit; letter-spacing: -0.75px; color: rgb(255, 0, 0);"><span style="border: 0px; font-variant: inherit; font-weight: 700; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit;">2020년 2월 20일</span></span><span style="font-size: 15px; letter-spacing: -0.75px;">부터 아래와 같이 변경됨에 따라 사전 안내드립니다.</span><br style="font-size: 15px; letter-spacing: -0.75px;"><br style="font-size: 15px; letter-spacing: -0.75px;"><span style="border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 700; font-stretch: inherit; font-size: 15px; line-height: inherit; letter-spacing: -0.75px;">&nbsp;&nbsp;- 구매 금액에 대한 포인트 적립율 1%로 변경<br>&nbsp; - 첫 구매 시 5,000포인트 추가 적립 혜택 삭제<br>&nbsp; - 기념일 해당 월 첫 구매 시 포인트 두 배 적립 혜택 삭제</span><br style="font-size: 15px; letter-spacing: -0.75px;"><br style="font-size: 15px; letter-spacing: -0.75px;"><span style="font-size: 15px; letter-spacing: -0.75px;">변경되는 내용을 꼭 확인해 주시기 바랍니다.</span><br style="font-size: 15px; letter-spacing: -0.75px;"><br style="font-size: 15px; letter-spacing: -0.75px;"><span style="font-size: 15px; letter-spacing: -0.75px;">※ 멤버십 회원 대상 특별 할인 및 이벤트 포인트 등 다양한 혜택이 제공될 예정입니다</span><br style="font-size: 15px; letter-spacing: -0.75px;"><br style="font-size: 15px; letter-spacing: -0.75px;"><span style="font-size: 15px; letter-spacing: -0.75px;">감사합니다.</span><br></p>',now()),
	(6,101,'등급별 혜택 안내','<h3>VVIP</h3>매월 1일 10,000포인트 지급<br><h3>VIP</h3>매월 1일 5,000포인트 지급<br><h3>GOLD</h3>매월 1일 3,000포인트 지급<br><h3>SILVER<h3/>매월 1일 2,000포인트 지급<br><h3>FAMILY</h3>매월 1일 1,000포인트 지급<br>',now());

-- 브렌드, 카테고리, 상품정보, 상품게시글, 상품이미지, 상품주문정보
insert into brand values
	(1,'닥터마틴', 'Dr.Martin'),
	(2,'나이키', 'NIKE'),
	(3,'팀버랜드', 'Timberland'),
	(4,'누오보',' NUOVO'),
	(5,'컨버스', 'Converse'),
	(6,'스케쳐스', 'Sketchers');

insert into category values
	(111,'운동화'),
	(222,'구두'),
	(333,'슬리퍼'),
	(555,'샌들'),
	(666,'슬립온'),
	(777,'부츠'),
	(888,'스니커즈'); 

insert into product values
	(11111,'카시안 다크브라운 샌들',1,'men',555,'천연(소)가죽','S/S',now(),178000,124900,now(),1,1,101),
	(22222,'팀버랜드 프리미엄',3,'men',777,'레더','S/S',now(),258000,246000,now(),1,1,101),
	(33333,'큐빅 블링 스퀘어뮬',4,'women',111,'합성섬유+천연소가죽','여름',now(),69000,59000,now(),1,1,101),
	(55555,'척70하이',5,'free',888,'면','사계절',now(),1250000,105000,now(),1,1,101),
	(66666,'비-쿨',6,'free',666,'니트 메쉬','여름',now(),94000,84000,now(),1,1,101);

insert into productpost values
	(11111,'DrMartin1-main.jpg','닥터마틴 샌들'),
	(22222,'Timberland-main.jpg','팀버랜드 부츠'),
	(33333,'women-myool-main.jpg','누오보 뮬'),
	(55555,'artistic-main.jpg','컨버스 스니커즈'),
	(66666,'sketchers-main.jpg','스케쳐스 슬립온');

insert into image values
	(1,11111,'DrMartin1-main.jpg'),
	(2,22222,'Timberland-main.jpg'),
	(3,33333,'women-myool-main.jpg'),
	(5,55555,'artistic-main.jpg'),
	(6,66666,'sketchers-main.jpg');

insert into orderoption values
	(11111,1,270,1000,'brown'),
	(22222,2,280,1000,'yellow'),
	(33333,1,230,1000,'black'),
	(33333,2,230,1000,'beige'),
	(33333,3,230,1000,'pink'),
	(55555,4,260,1000,'mixed-color'),
	(66666,5,270,1000,'black');

insert into orderoption values
	(33333,1,260,1000,'black'),
	(33333,1,250,1000,'black'),
	(33333,1,240,1000,'black'),
	(33333,4,240,1000,'sett'),
	(33333,5,260,1000,'xcvb'),
	(33333,6,270,1000,'sdf');
 

-- 등급, 회원상세정보, 회원정보
insert into grade values
	(1,'FAMILY',0.01),
	(2,'SILVER',0.02),
	(3,'GOLD',0.03),
	(4,'VIP',0.05),
	(5,'VVIP',0.1);

select * from memberdetail m2 ;
insert into memberdetail values
	('aaa',password('rootroot'),'테스트1',true,19850101,'test1@test.co.kr','010-111-8888','12345','국채보상로 438','서구 치과의원'),
	('aaa1',password('rootroot'),'테스트1',true,19880101,'test2@test.co.kr','010-111-8888','12345','국채보상로 438','서구 치과의원'),
	('aaa2',password('rootroot'),'테스트1',true,19750101,'test3@test.co.kr','010-111-8888','12345','국채보상로 438','서구 치과의원'),
	('aaa3',password('rootroot'),'테스트1',false,19790101,'test4@test.co.kr','010-111-8888','12345','국채보상로 438','서구 치과의원'),
	('aaa4',password('rootroot'),'테스트1',true,19730101,'test5@test.co.kr','010-111-8888','12345','국채보상로 438','서구 치과의원'),
	('bbb',password('rootroot'),'테스트2',true,19980101,'test6@test.co.kr','010-222-7777','12345','동대구로 386','킹덤 오피스텔 지하 1층'),
	('bbb1',password('rootroot'),'테스트2',true,19920101,'test7@test.co.kr','010-222-7777','12345','동대구로 386','킹덤 오피스텔 지하 1층'),
	('bbb2',password('rootroot'),'테스트2',false,19900101,'test8@test.co.kr','010-222-7777','12345','동대구로 386','킹덤 오피스텔 지하 1층'),
	('bbb3',password('rootroot'),'테스트2',true,19850101,'test9@test.co.kr','010-222-7777','12345','동대구로 386','킹덤 오피스텔 지하 1층'),
	('bbb4',password('rootroot'),'테스트2',false,19880101,'test10@test.co.kr','010-222-7777','12345','동대구로 386','킹덤 오피스텔 지하 1층'),
	('ccc',password('rootroot'),'테스트3',true,19800101,'test11@test.co.kr','010-333-6666','12345','상화로 373','비둘기 아파트 2단지'),
	('ccc1',password('rootroot'),'테스트3',false,19990101,'test12@test.co.kr','010-333-6666','12345','상화로 373','비둘기 아파트 2단지'),
	('ccc2',password('rootroot'),'테스트3',true,19990101,'test13@test.co.kr','010-333-6666','12345','상화로 373','비둘기 아파트 2단지'),
	('ccc3',password('rootroot'),'테스트3',false,20040101,'test14@test.co.kr','010-333-6666','12345','상화로 373','비둘기 아파트 2단지'),
	('ccc4',password('rootroot'),'테스트3',true,20040101,'test15@test.co.kr','010-333-6666','12345','상화로 373','비둘기 아파트 2단지'),
	('ddd',password('rootroot'),'테스트4',false,20040101,'test16@test.co.kr','010-666-5555','12345','서대구로 30','맨투맨 빌딩 4층'),
	('ddd1',password('rootroot'),'테스트4',true,20040101,'test17@test.co.kr','010-666-5555','12345','서대구로 30','맨투맨 빌딩 4층'),
	('ddd2',password('rootroot'),'테스트4',false,19990101,'test18@test.co.kr','010-666-5555','12345','서대구로 30','맨투맨 빌딩 4층'),
	('ddd3',password('rootroot'),'테스트4',false,19990101,'test19@test.co.kr','010-666-5555','12345','서대구로 30','맨투맨 빌딩 4층'),
	('ddd4',password('rootroot'),'테스트4',true,19990101,'test20@test.co.kr','010-666-5555','12345','서대구로 30','맨투맨 빌딩 4층'),
	('eee',password('rootroot'),'테스트5',true,19990101,'test21@test.co.kr','010-999-3333','12345','안심로90길 22','해피키즈 유치원'),
	('eee1',password('rootroot'),'테스트5',false,19990101,'test22@test.co.kr','010-999-3333','12345','안심로90길 22','해피키즈 유치원'),
	('eee2',password('rootroot'),'테스트5',true,19990101,'test23@test.co.kr','010-999-3333','12345','안심로90길 22','해피키즈 유치원'),
	('eee3',password('rootroot'),'테스트5',true,19990101,'test24@test.co.kr','010-999-3333','12345','안심로90길 22','해피키즈 유치원'),
	('eee4',password('rootroot'),'테스트5',true,19990101,'test25@test.co.kr','010-999-3333','12345','안심로90길 22','해피키즈 유치원');

insert into `member` values
	(111111,'aaa',1000,0,5,false,now()),
	(111112,'aaa1',1000,0,5,false,now()),
	(111113,'aaa2',1000,0,5,false,now()),
	(111114,'aaa3',1000,0,5,false,now()),
	(111115,'aaa4',1000,0,5,false,now()),
	(111116,'bbb',1000,0,5,false,now()),
	(111117,'bbb1',1000,0,5,false,now()),
	(111118,'bbb2',1000,0,5,false,now()),
	(111119,'bbb3',1000,0,5,false,now()),
	(111120,'bbb4',1000,0,5,false,now()),
	(111121,'ccc',1000,0,5,false,now()),
	(111122,'ccc1',1000,0,5,false,now()),
	(111123,'ccc2',1000,0,5,false,now()),
	(111124,'ccc3',1000,0,5,false,now()),
	(111125,'ccc4',1000,0,5,false,now()),
	(111126,'ddd',1000,0,5,false,now()),
	(111127,'ddd1',1000,0,5,false,now()),
	(111128,'ddd2',1000,0,5,false,now()),
	(111129,'ddd3',1000,0,5,false,now()),
	(111130,'ddd4',1000,0,5,false,now()),
	(111131,'eee',1000,0,5,false,now()),
	(111132,'eee1',1000,0,5,false,now()),
	(111133,'eee2',1000,0,5,false,now()),
	(111134,'eee3',1000,0,5,false,now()),
	(111135,'eee4',1000,0,5,false,now());

-- 상품문의게시판
insert into qna values
	(1,111111,11111,'질문 있습니다.','추천 해주세요','이 상품은 어떠신가요?',now()),
	(2,111112,22222,'재고 있나요?','사이즈 240인데, 품절이길래 질문 남깁니다.','입고 예정입니다',now()),
	(3,111113,33333,'발볼 때문에 사이즈가 고민 됩니다','발볼이 넓어서요','반 사이즈 크게 추천드려요',now()),
	(4,111114,55555,'수선 가능할까요?','뒷꿈치가 좀 헐렁해서요','',now()),
	(5,111115,66666,'쿠션감이 충분한가요?','쿠션이 어느정도인지 모르겠어요','',now());

-- 장바구니
insert into cart values 
	(1,111111,270,11111,1,20),
	(2,111112,270,11111,1,20),
	(3,111113,270,11111,1,20),
	(4,111114,270,11111,1,20),
	(5,111115,270,11111,1,20),
	(6,111111,270,11111,1,20),
	(7,111111,270,11111,1,20),
	(8,111111,270,11111,1,20),
	(9,111111,270,11111,1,20);


-- 주문정보, 배송지정보, 주문상품
insert into `order` values
	(10014,111111,now(),null,124900,1,false,null,false),
	(10015,111112,now(),null,50000,1,false,null,false),
	(10016,111113,now(),null,50000,1,false,null,false),
	(10017,111114,now(),null,50000,1,false,null,false),
	(10018,111115,now(),null,50000,1,false,null,false);

insert into address values
	(10014,'테스트1','41806','국채보상로 438','서구 치과의원','010-111-8888'),
	(10015,'테스트2','42020','동대구로 386','킹덤 오피스텔 지하 1층','010-222-7777'),
	(10016,'테스트3','42813','상화로 373','비둘기 아파트 2단지','010-333-6666'),
	(10017,'테스트4','41865','서대구로 30','맨투맨 빌딩 4층','010-666-5555'),
	(10018,'테스트5','41092','안심로90길 22','해피키즈 유치원','010-999-3333');

insert into orderproduct values
	(10014,11111,1,270,1),
	(10015,22222,2,280,15),
	(10016,33333,3,230,20),
	(10017,55555,4,260,30),
	(10018,66666,5,270,20);

-- 상품후기게시판, 후기이미지
insert into review values
	(1,10014,11111,'완전 편해요!!!','짱짱!!!',now()),
	(2,10015,22222,'신발이 편해요','쿠션감 짱짱!!',now()),
	(3,10016,33333,'배송이 너무 늦었어요','한참 기다렸어요ㅠㅠ',now()),
	(4,10017,44444,'맘에 들어요','재구매각이에요...!',now()),
	(5,10018,55555,'고민하다가 샀어요','사길 잘한 것 같아요',now());

insert into reviewimage values
	(1,1,'DrMartin1-main.jpg'),
	(2,2,'Timberland-main.jpg'),
	(3,3,'women-myool-main.jpg'),
	(4,4,'artistic-main.jpg'),
	(5,5,'sketchers-main.jpg');