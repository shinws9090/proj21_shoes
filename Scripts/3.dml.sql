
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
	(505,'신입',2,'test',password('123456'),'test@test.co.kr','010-0000-0000');

insert into notice values
	(1,101,'교환 및 반품 안내사항','★꼭 읽어주세요★',now()),
	(2,101,'적립금 소멸 안내','유효기간 만료 미사용 적립금 소멸 안내',now()),
	(3,101,'카드사별 무이자 할인 혜택','카드사 무이자 할부, 부분 무이자 할부',now()),
	(4,101,'일주일동안, 위클리 세일!','BEST 상품만 최대 90% SALE',now()),
	(5,101,'카카오 알림톡 & 실시간 서비스','<p><span style="font-size: 15px; letter-spacing: -0.75px;">안녕하세요.</span><br style="font-size: 15px; letter-spacing: -0.75px;"><span style="font-size: 15px; letter-spacing: -0.75px;">포인트 정책이&nbsp;</span><span style="border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 15px; line-height: inherit; letter-spacing: -0.75px; color: rgb(255, 0, 0);"><span style="border: 0px; font-variant: inherit; font-weight: 700; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit;">2020년 2월 20일</span></span><span style="font-size: 15px; letter-spacing: -0.75px;">부터 아래와 같이 변경됨에 따라 사전 안내드립니다.</span><br style="font-size: 15px; letter-spacing: -0.75px;"><br style="font-size: 15px; letter-spacing: -0.75px;"><span style="border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 700; font-stretch: inherit; font-size: 15px; line-height: inherit; letter-spacing: -0.75px;">&nbsp;&nbsp;- 구매 금액에 대한 포인트 적립율 1%로 변경<br>&nbsp; - 첫 구매 시 5,000포인트 추가 적립 혜택 삭제<br>&nbsp; - 기념일 해당 월 첫 구매 시 포인트 두 배 적립 혜택 삭제</span><br style="font-size: 15px; letter-spacing: -0.75px;"><br style="font-size: 15px; letter-spacing: -0.75px;"><span style="font-size: 15px; letter-spacing: -0.75px;">변경되는 내용을 꼭 확인해 주시기 바랍니다.</span><br style="font-size: 15px; letter-spacing: -0.75px;"><br style="font-size: 15px; letter-spacing: -0.75px;"><span style="font-size: 15px; letter-spacing: -0.75px;">※ 멤버십 회원 대상 특별 할인 및 이벤트 포인트 등 다양한 혜택이 제공될 예정입니다</span><br style="font-size: 15px; letter-spacing: -0.75px;"><br style="font-size: 15px; letter-spacing: -0.75px;"><span style="font-size: 15px; letter-spacing: -0.75px;">감사합니다.</span><br></p>',now());

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
	(33333,3,230,1000,'black, beige, pink'),
	(55555,4,260,1000,'mixed-color'),
	(66666,5,270,1000,'black');

insert into orderoption values
	(33333,1,260,1000,'brown'),
	(33333,1,250,1000,'brown'),
	(33333,1,240,1000,'brown'),
	(33333,1,230,1000,'brown'),
	(33333,2,280,1000,'ser'),
	(33333,3,240,1000,'sett'),
	(33333,4,260,1000,'xcvb'),
	(33333,5,270,1000,'sdf');
 

-- 등급, 회원상세정보, 회원정보
insert into grade values
	(1,'VVIP'),
	(2,'VIP'),
	(3,'GOLD'),
	(4,'SILVER'),
	(5,'FAMILY');

insert into memberdetail values
	('aaa',password('rootroot'),'테스트1',true,now(),'test1@test.co.kr','010-111-8888','12345','국채보상로 438','서구 치과의원'),
	('bbb',password('rootroot'),'테스트2',true,now(),'test2@test.co.kr','010-222-7777','12345','동대구로 386','킹덤 오피스텔 지하 1층'),
	('ccc',password('rootroot'),'테스트3',true,now(),'test3@test.co.kr','010-333-6666','12345','상화로 373','비둘기 아파트 2단지'),
	('ddd',password('rootroot'),'테스트4',true,now(),'test4@test.co.kr','010-666-5555','12345','서대구로 30','맨투맨 빌딩 4층'),
	('eee',password('rootroot'),'테스트5',true,now(),'test5@test.co.kr','010-999-3333','12345','안심로90길 22','해피키즈 유치원');

insert into `member` values
	(111111,'aaa',1000,0,5,false,now()),
	(111112,'bbb',1000,0,5,false,now()),
	(111113,'ccc',1000,0,5,false,now()),
	(111114,'ddd',1000,0,5,false,now()),
	(111115,'eee',1000,0,5,false,now());

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
	(5,111115,270,11111,1,20);


-- 주문정보, 배송지정보, 주문상품
insert into `order` values
	(10001,111111,now(),1000,false,'배송코드',false),
	(10002,111112,now(),1000,false,'배송코드',false),
	(10003,111113,now(),1000,false,'배송코드',false),
	(10004,111114,now(),1000,false,'배송코드',false),
	(10005,111115,now(),1000,false,'배송코드',false);

insert into address values
	(10001,'테스트1','41806','국채보상로 438','서구 치과의원','010-111-8888'),
	(10002,'테스트2','42020','동대구로 386','킹덤 오피스텔 지하 1층','010-222-7777'),
	(10003,'테스트3','42813','상화로 373','비둘기 아파트 2단지','010-333-6666'),
	(10004,'테스트4','41865','서대구로 30','맨투맨 빌딩 4층','010-666-5555'),
	(10005,'테스트5','41092','안심로90길 22','해피키즈 유치원','010-999-3333');

insert into orderproduct values
	(10001,11111,1,270,10),
	(10002,22222,2,280,15),
	(10003,33333,3,230,20),
	(10004,55555,4,260,30),
	(10005,66666,5,270,20);

-- 상품후기게시판, 후기이미지
insert into review values
	(1,10001,11111,'이 가격에 이 퀄리티 리얼?','가성비 좋아요~',now()),
	(2,10002,22222,'신발이 편해요','쿠션감 짱짱!!',now()),
	(3,10003,33333,'배송이 너무 늦었어요','한참 기다렸어요ㅠㅠ',now()),
	(4,10004,44444,'맘에 들어요','재구매각이에요...!',now()),
	(5,10005,55555,'고민하다가 샀어요','사길 잘한 것 같아요',now());

insert into reviewimage values
	(1,1,'DrMartin1-main.jpg'),
	(2,2,'Timberland-main.jpg'),
	(3,3,'women-myool-main.jpg'),
	(4,4,'artistic-main.jpg'),
	(5,5,'sketchers-main.jpg');