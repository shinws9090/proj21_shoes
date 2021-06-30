desc memberdetail ;
select  member_id,member_pwd from memberdetail where member_id ='1234'
and member_pwd =password('111111');
  select count(*) 
	from vw_myReview   where 
	member_id ='1234' and buy_confirm_state is true and board_code is null;

select distinct
board_code, order_code, title, content, regist_date, member_code, member_id,
	order_date, payment_amount, payment_state, delivery_code, buy_confirm_state, 
	product_code, style_code, `size`, order_count, color, product_name, brand_code,
	gender, product_category_code, category, material, season, made_date,
	sell_Price, brand_name, brand_eng_name, product_main_image, /*image_code,*/ image
	from vw_myReview  where member_id ='1235'and board_code is not null and buy_confirm_state is true 
 order by regist_date desc;

SELECT * from member WHERE member_id = '1235';
select * from  `order` where member_code=111117;
 where member_code =(select member_code from member where member_id ='1234') ;

select board_code, order_code, title, content, regist_date, member_code, member_id, order_date, payment_amount, payment_state, delivery_code, buy_confirm_state, product_code, style_code, `size`, order_count, color, product_name, brand_code, gender, product_category_code, material, season, made_date, sell_Price, brand_name, product_main_image, image_code, image 
from vw_myReview  where member_id ='1234';

select * from vw_myreview where member_id ='1234' and board_code is null;

select count(*)
from vw_myreview vm  where member_id ='1234' and board_code is null;
from vw_myreview vm  where member_id ='1234' and board_code is not null;


select board_code, order_code, title, content, regist_date, member_code, member_id,
order_date, payment_amount, payment_state, delivery_code, buy_confirm_state, 
product_code, style_code, `size`, order_count, color, product_name, brand_code,
gender, product_category_code, category, material, season, made_date,
sell_Price, brand_name, brand_eng_name, product_main_image, image_code, image 	 
from vw_myReview  where member_id ='1234' and board_code is null
 order by regist_date desc

select board_code, order_code, title, content, regist_date, 
member_code, member_id, order_date, payment_amount, payment_state,
delivery_code, buy_confirm_state, product_code, style_code, `size`,
order_count, color, product_name, brand_code, gender, product_category_code,
category, material, season, made_date, costPrice, sell_Price, brand_name,
brand_eng_name, product_main_image, image_code, image 
from vw_myReview where order_code =10006;

select * from review;
select * from vw_myReview;
-- 상품후기게시판
INSERT INTO sinabro.review
(order_code,product_code ,title, content, regist_date)
VALUES(10007, 11111, 'aaa', 'aaa', now());

select * from `order`;
select * from vw_myorderdata;

select 
rv.board_code ,
od.order_code,
rv.product_code ,
rv.title ,
rv.content ,
rv.regist_date ,
riv.image,
riv.image_code ,
od.member_code,
od.order_date ,
od.payment_amount ,
od.payment_state ,
od.delivery_code ,
od.buy_confirm_state,
o.product_code ,
o.style_code ,
o.`size` ,
o.order_count 
from review as rv 
left join reviewimage as riv on riv.board_code =rv .board_code 
left join `order` as od on rv.order_code = od.order_code
left join orderproduct as o on rv.order_code =o.order_code ;
left join 
;
-- -- 
create or replace view  vw_myReview as
select 
rv.board_code ,
od.order_code,
o.product_code ,
rv.title ,
rv.content ,
rv.regist_date ,
riv.image,
riv.image_code ,
od.member_code,
od.order_date ,
od.payment_amount ,
od.payment_state ,
od.delivery_code ,
od.buy_confirm_state,
o.style_code ,
o.`size` ,
o.order_count ,
op.color ,
p.product_name,
p.brand_code ,
p.gender ,
p.product_category_code ,
p.material ,
p.season ,
p.made_date ,
p.sell_Price,
p2.product_main_image,
b.brand_name ,
b.brand_eng_name, 
c.category ,
m.member_id 
from `order` as od 
left join review as rv on od.order_code =rv.order_code
left join reviewimage as riv on riv.board_code =rv .board_code 
left join orderproduct as o on od.order_code =o.order_code
left join orderoption as op on o.product_code =op.product_code and o.style_code =op.style_code and o.`size`=op.`size`
left join product as p on p.product_code =op.product_code 
left join productpost as p2 on p.product_code =p2.product_code
left join brand as b on p.brand_code =b.brand_code 
left join category c on p.product_category_code =c.product_category_code
left join member m on od.member_code = m.member_code;

--



left join product as pd on od

left join  orderoption as op on op.product_code =
;



select board_code, order_code, title, content, regist_date, member_code, member_id, 
	order_date, payment_amount, payment_state, delivery_code, buy_confirm_state, product_code, 
	style_code, `size`, order_count, color, product_name, brand_code, gender, product_category_code,
	 material, season, made_date, sell_Price, brand_name, product_main_image, image_code, image 
from vw_myReview  where member_id = '1234'
 order by regist_date DESC;

select * from member where member_id ='1234'

UPDATE `order`
SET buy_confirm_state=1
WHERE order_code=10001;




-- 5.-------예진_ 마이페이지 나의 상품후기리스트 뷰--------------------------------------------------------------------------------------------------------------------------
create or replace view  vw_myReview as;
	select 
		rv.board_code, 			-- 게시판코드
		od.order_code,			-- 주문코드
		rv.title, 				-- 제목
		rv.content,				-- 내용
		rv.regist_date,			-- 등록일
		od.member_code ,		-- 회원코드
		m.member_id,			-- 회원아이디
		od.order_date ,			-- 주문일
		od.payment_amount ,		-- 결제금액
		od.payment_state ,  	-- 결제여부
		od.delivery_code , 		-- 배송코드
		od.buy_confirm_state, 	-- 구매확정여부
		odop.product_code ,  		-- 상품코드
		op.style_code , 		-- 스타일코드
		op.`size` , 			-- 사이즈
		op.order_count ,		-- 주문수량
		odop.color , 			-- 색상
		pd.product_name , 		-- 상품명
		pd.brand_code , 		-- 브랜드코드
		pd.gender , 			-- 성별
		pd.product_category_code, -- 상품종류코드
		c.category,				-- 종류
		pd.material, 			-- 소재
		pd.season, 				-- 계절
		pd.made_date, 			-- 제조일
		pd.costPrice, 			-- 원가
		pd.sell_Price, 			-- 판매가
		b.brand_name, 			-- 브랜드명
		b.brand_eng_name,		-- 브랜드 영어명
		p.product_main_image,	-- 상품대표이미지
		rvi.image_code, 		-- 이미지코드
		rvi.image 				-- 이미지		
		from review as rv
		left join reviewimage as rvi on rv.board_code =rvi.board_code 
		left join `order` as od on od.order_code =rv.order_code 
		left join orderproduct as op on op.product_code = odop.product_code
		left join orderoption as odop on op.product_code = odop.product_code 
		left join product as pd on odop.product_code =pd.product_code 
		left join productpost as p on pd.product_code =p.product_code
		left join brand as b on pd.brand_code =b.brand_code
		left join category as c on pd.product_category_code =c.product_category_code 
		left join member m on od.member_code =m.member_code;
	
-- 	--------------------------------------------------------------------------------------------------------------------------------------------------



select * from review;
select * from vw_myreview ;
select * from `order`;
select * from `order`  where member_code = 111116; and payment_state=true;

select 
rv.board_code,
od.order_code, 
od.member_code, 
od.order_date, 
od.payment_amount, 
od.payment_state,
od.delivery_code, 
od.buy_confirm_state,
rv.product_code,
rv.title,
rv.content,
rv.regist_date
from `order` as od
join review as rv on od.order_code = rv.order_code ;
where od.member_code =(select member_code from member where member_id ='1234')





select * from qna;

select  * from vw_myReview where member_id ='1234' and board_code is null;

select 
		rv.board_code, 			-- 게시판코드
		od.order_code,			-- 주문코드
		rv.title, 				-- 제목
		rv.content,				-- 내용
		rv.regist_date,			-- 등록일
		od.member_code ,		-- 회원코드
		m.member_id,			-- 회원아이디
		od.order_date ,			-- 주문일
		od.payment_amount ,		-- 결제금액
		od.payment_state ,  	-- 결제여부
		od.delivery_code , 		-- 배송코드
		od.buy_confirm_state, 	-- 구매확정여부
		op.product_code ,  		-- 상품코드
		op.style_code , 		-- 스타일코드
		op.`size` , 			-- 사이즈
		op.order_count ,		-- 주문수량
		odop.color , 			-- 색상
		pd.product_name , 		-- 상품명
		pd.brand_code , 		-- 브랜드코드
		pd.gender , 			-- 성별
		pd.product_category_code, -- 상품종류코드
		c.category,				-- 종류
		pd.material, 			-- 소재
		pd.season, 				-- 계절
		pd.made_date, 			-- 제조일
		pd.costPrice, 			-- 원가
		pd.sell_Price, 			-- 판매가
		b.brand_name, 			-- 브랜드명
		b.brand_eng_name,		-- 브랜드 영어명
		p.product_main_image,	-- 상품대표이미지
		rvi.image_code, 		-- 이미지코드
		rvi.image 				-- 이미지		
		from product as pd 
		left join productpost as p on pd.product_code =p.product_code
		join orderoption as odop on pd.product_code =odop.product_code 
		join orderproduct as op on odop.product_code =op.product_code 
		left join `order` as od on od.order_code =op.order_code 
		join review as rv	on rv.order_code =od.order_code 
		left join reviewimage as rvi on rv.board_code =rvi.board_code 
		left join brand as b on pd.brand_code =b.brand_code
		left join category c on pd.product_category_code =c.product_category_code 
		left join member m on od.member_code =m.member_code where member_id = '1234';

	-- 5.-------예진_ 마이페이지 나의 상품후기리스트 뷰--------------------------------------------------------------------------------------------------------------------------
create or replace view  vw_myReview as
	select 
		rv.board_code, 			-- 게시판코드
		rv.order_code,			-- 주문코드
		rv.title, 				-- 제목
		rv.content,				-- 내용
		rv.regist_date,			-- 등록일
		od.member_code ,		-- 회원코드
		m.member_id,			-- 회원아이디
		od.order_date ,			-- 주문일
		od.payment_amount ,		-- 결제금액
		od.payment_state ,  	-- 결제여부
		od.delivery_code , 		-- 배송코드
		od.buy_confirm_state, 	-- 구매확정여부
		op.product_code ,  		-- 상품코드
		op.style_code , 		-- 스타일코드
		op.`size` , 			-- 사이즈
		op.order_count ,		-- 주문수량
		odop.color , 			-- 색상
		pd.product_name , 		-- 상품명
		pd.brand_code , 		-- 브랜드코드
		pd.gender , 			-- 성별
		pd.product_category_code, -- 상품종류코드
		c.category,				-- 종류
		pd.material, 			-- 소재
		pd.season, 				-- 계절
		pd.made_date, 			-- 제조일
		pd.costPrice, 			-- 원가
		pd.sell_Price, 			-- 판매가
		b.brand_name, 			-- 브랜드명
		b.brand_eng_name,		-- 브랜드 영어명
		p.product_main_image,	-- 상품대표이미지
		rvi.image_code, 		-- 이미지코드
		rvi.image 				-- 이미지		
		from product as pd 
		left join productpost as p on pd.product_code =p.product_code /*상품 게시글 테이블과 상품정보 테이블 조인*/		
		left join orderoption as odop on pd.product_code =odop.product_code 
		left join orderproduct as op on odop.product_code =op.product_code 
		left join `order` as od on od.order_code =op.order_code 
		left join review as rv	on rv.order_code =od.order_code 
		left join reviewimage as rvi on rv.board_code =rvi.board_code 
		left join brand as b on pd.brand_code =b.brand_code
		left join category c on pd.product_category_code =c.product_category_code 
		left join member m on od.member_code =m.member_code;
	
-- 	--------------------------------------------------------------------------------------------------------------------------------------------------

	
	
insert into review values
	(1,10001,11111,'이 가격에 이 퀄리티 리얼?','가성비 좋아요~',now()),
	(2,10002,22222,'신발이 편해요','쿠션감 짱짱!!',now()),
	(3,10003,33333,'배송이 너무 늦었어요','한참 기다렸어요ㅠㅠ',now()),
	(4,10004,44444,'맘에 들어요','재구매각이에요...!',now()),
	(5,10005,55555,'고민하다가 샀어요','사길 잘한 것 같아요',now());

select board_code, member_code, member_id, product_code, product_name, title, content, regist_date from vw_myqna 
where member_id='1234';
--  -------------------문의글 수정
UPDATE qna
SET  title='업데이트테스트제목', content='업데이트테스트내용'
WHERE board_code=1;
-- --------------------------------------------

-- 5.-------예진_ 마이페이지 나의 상품후기리스트 뷰--------------------------------------------------------------------------------------------------------------------------
create or replace view  vw_myReview as
	select 
		rv.board_code, 			-- 게시판코드
		rv.order_code,			-- 주문코드
		rv.title, 				-- 제목
		rv.content,				-- 내용
		rv.regist_date,			-- 등록일
		od.member_code ,		-- 회원코드
		m.member_id,			-- 회원아이디
		od.order_date ,			-- 주문일
		od.payment_amount ,		-- 결제금액
		od.payment_state ,  	-- 결제여부
		od.delivery_code , 		-- 배송코드
		od.buy_confirm_state, 	-- 구매확정여부
		op.product_code ,  		-- 상품코드
		op.style_code , 		-- 스타일코드
		op.`size` , 			-- 사이즈
		op.order_count ,		-- 주문수량
		odop.color , 			-- 색상
		pd.product_name , 		-- 상품명
		pd.brand_code , 		-- 브랜드코드
		pd.gender , 			-- 성별
		pd.product_category_code, -- 상품종류코드
		c.category,				-- 종류
		pd.material, 			-- 소재
		pd.season, 				-- 계절
		pd.made_date, 			-- 제조일
		pd.costPrice, 			-- 원가
		pd.sell_Price, 			-- 판매가
		b.brand_name, 			-- 브랜드명
		b.brand_eng_name,		-- 브랜드 영어명
		p.product_main_image,	-- 상품대표이미지
		rvi.image_code, 		-- 이미지코드
		rvi.image 				-- 이미지		
		from product as pd 
		left join productpost as p on pd.product_code =p.product_code
		left join orderoption as odop on pd.product_code =odop.product_code 
		left join orderproduct as op on odop.product_code =op.product_code 
		left join `order` as od on od.order_code =op.order_code 
		left join review as rv	on rv.order_code =od.order_code 
		left join reviewimage as rvi on rv.board_code =rvi.board_code 
		left join brand as b on pd.brand_code =b.brand_code
		left join category c on pd.product_category_code =c.product_category_code 
		left join member m on od.member_code =m.member_code;
	
-- 	--------------------------------------------------------------------------------------------------------------------------------------------------




-- 5.-------예진_ 마이페이지 나의 상품후기리스트 뷰(db수정전)--------------------------------------------------------------------------------------------------------------------------
create or replace view  vw_myReview as
	select 
		rv.board_code, 			-- 게시판코드
		rv.order_code,			-- 주문코드
		rv.title, 				-- 제목
		rv.content,				-- 내용
		rv.regist_date,			-- 등록일
		od.member_code ,		-- 회원코드
		m.member_id,			-- 회원아이디
		od.order_date ,			-- 주문일
		od.payment_amount ,		-- 결제금액
		od.payment_state ,  	-- 결제여부
		od.delivery_code , 		-- 배송코드
		od.buy_confirm_state, 	-- 구매확정여부
		op.product_code ,  		-- 상품코드
		op.style_code , 		-- 스타일코드
		op.`size` , 			-- 사이즈
		op.order_count ,		-- 주문수량
		odop.color , 			-- 색상
		pd.product_name , 		-- 상품명
		pd.brand_code , 		-- 브랜드코드
		pd.gender , 			-- 성별
		pd.product_category_code, -- 상품종류코드
		pd.material, 			-- 소재
		pd.season, 				-- 계절
		pd.made_date, 			-- 제조일
		pd.sell_Price, 			-- 원가
		b.brand_name, 			-- 판매가
		p.product_main_image,	-- 상품대표이미지
		rvi.image_code, 		-- 이미지코드
		rvi.image 				-- 이미지		
		from product as pd 
		left join productpost as p on pd.product_code =p.product_code
		left join orderoption as odop on pd.product_code =odop.product_code 
		left join orderproduct as op on odop.product_code =op.product_code 
		left join `order` as od on od.order_code =op.order_code 
		left join review as rv	on rv.order_code =od.order_code 
		left join reviewimage as rvi on rv.board_code =rvi.board_code 
		left join brand as b on pd.brand_code =b.brand_code
		left join category c on pd.product_category_code =c.product_category_code 
		left join member m on od.member_code =m.member_code;
	
-- 	--------------------------------------------------------------------------------------------------------------------------------------------------





-- 상품후기게시판
select board_code, order_code, title, content, regist_date 
	from review 

delete qna where board_code=21;

select * from vw_myorderdata where order_code=10006;

select member_code, member_id, `point`, cumulative_buy_amount, grade_code, quit_state, signUp_date from member;

	select member_id, member_pwd, member_name, gender, birthday, email, tel, zipCode, address, detail_address 
	from memberDetail where member_id = '회원아이디';
	
select member_id, member_pwd, member_name, gender, birthday, email, tel, zipCode, address, detail_address 
	from memberDetail where member_id ='회원아이디'
	
-- 
select  member_id, passmember_pwd
from memberdetail where member_id ='123' and member_pwd = password('123123');


	


-- 상품문의게시판 / 멤버코드는 컨트롤러에서 id로 select해서 넣어주자*/
INSERT INTO sinabro.qna  
(member_code, product_code, title, content, reply, regist_date)
VALUES(111116, 0, '일반문의 테스트 제목입니다', '일반문의 테스트 내용입니다.', '답변입니다.', now());






insert into qna (member_code, product_code, title, content, reply, regist_date)values
	(111116,11111,'질문 있습니다.','추천 해주세요','이 상품은 어떠신가요?',now()),
	(111116,11111,'재고 있나요?','사이즈 240인데, 품절이길래 질문 남깁니다.','입고 예정입니다',now()),
	(111116,11111,'발볼 때문에 사이즈가 고민 됩니다','발볼이 넓어서요','반 사이즈 크게 추천드려요',now()),
	(111116,11111,'수선 가능할까요?','뒷꿈치가 좀 헐렁해서요','가능합니다',now()),
	(111116,11111,'쿠션감이 충분한가요?','쿠션이 어느정도인지 모르겠어요','충분히 있어서 불편하지 않아요',now());









	-- 등급, 회원상세정보, 회원정보
insert into grade values
	(1,'등급');


insert into memberdetail values
	('123',password('123123'),'회원이름',true,now(),'이메일','연락처','12345','주소','상세주소');

-- 회원정보
INSERT INTO member
(member_id, point, cumulative_buy_amount, grade_code, quit_state, signUp_date)
VALUES('55', 1, 1, 1, 1, '11-11-11 11:11:11');


-- 상품문의게시판
insert into qna values
	(1,1,1,'제목','내용','답글',now());

-- 장바구니
insert into cart values
	(1,1,260,1,1,20);

-- 마이페이지 모든정보 검색용 뷰 만들기----------------------------------------------------

select member_id, member_pwd, member_name, gender, birthday, email, tel, zipCode, address, detail_address from memberdetail;
select member_code, member_id, `point`, cumulative_buy_amount, grade_code, quit_state, signUp_date from member;

create or replace view  vw_mypageData as
	select md.member_id, md.member_pwd,md.member_name, if((md.gender)=true,'여','남') as gender,md.birthday,md.email,md.tel,md.zipCode,md.address,md.detail_address,
		   m.point,m.cumulative_buy_amount,g.grade, m.signUp_date -- 탈퇴여부 뺌
from memberdetail  md left join member m  on md.member_id =m.member_id  left join grade g on m.grade_code =g.grade_code ;
-- ---------------------------------
select member_id, member_pwd, member_name, gender, birthday, email, tel, zipCode, address, detail_address, point, cumulative_buy_amount, grade,  signUp_date
from vw_mypagedata where member_id=11; 


-- -----------------------------------------------
UPDATE sinabro.memberdetail
SET member_pwd='', member_name='', gender=0, birthday='', email='', tel='', zipCode='', address='', detail_address=''
WHERE member_id='';

-- -----------
UPDATE member
SET quit_state=0
WHERE member_id=22;


-- 

select 
member_id, member_pwd, member_name, gender, birthday, email, tel, zipCode, address, detail_address from memberDetail 
where member_name='김예진' and email ='chamdodari@gmail.com33';


select 
member_id, member_pwd, member_name, gender, birthday, email, tel, zipCode, address, detail_address from memberDetail 
where  member_id ='33' and  member_name='김예진' and email ='chamdodari@gmail.com33' ;

/*111124*/

select * from product;

select * from member;

-- 
-- 상품문의게시판  - 회원아이디로 검색쓰
select board_code, -- 게시판코드
member_code,	   -- 회원코드 (member)
product_code,  		-- 상품코드 (productPost) 상품게시글에이:ㅆ음
(select product_name from product where product_code=11111)as product_name,
title, 				-- 제목
content, 			-- 내용
reply, 				-- 답글
regist_date 		-- 등록일
	from qna where member_code =(select member_code from member where member_id ='1234') ;

insert into qna values
	(7,111124,11111,'테스트질문','내용','답변',now());


-- 상품문의게시판  - 회원아이디로 검색쓰
select board_code, 
member_code,product_code, title,content,reply,regist_date 		
	from qna where member_code =(select member_code from member where member_id ='1234') ;

insert into qna values

-- 상품문의게시판
insert into qna (member_code, product_code, title, content, reply, regist_date) values
	(111124,11111,'질문 있습니다.','추천 해주세요','이 상품은 어떠신가요?',now()),
	(111124,22222,'재고 있나요?','사이즈 240인데, 품절이길래 질문 남깁니다.','입고 예정입니다',now()),
	(111124,33333,'발볼 때문에 사이즈가 고민 됩니다','발볼이 넓어서요','반 사이즈 크게 추천드려요',now()),
	(111124,55555,'수선 가능할까요?','뒷꿈치가 좀 헐렁해서요','가능합니다',now()),
	(111124,66666,'쿠션감이 충분한가요?','쿠션이 어느정도인지 모르겠어요','충분히 있어서 불편하지 않아요',now());


--  주문정보 관련 출력되야할 칼럼 : 조건 --> 주문코드, 회원코드 ( dto에는 주문일:start_date, end_date로 넣어서 검색할수있게 sql에 넣기. 페이징은 한페이지에 10개씩만 보이게하기.)
-- 주문정보 테이블 : 주문일,결제금액,결제여부,배송코드,구매확정여부,
--  배송지정보 테이블 받는사람,우편번호,주소,상세주소,연락처 
-- 주문상품 테이블 : 주문수량,사이즈
-- 상품주문정보 테이블 : 색상,
-- 상품이미지 :이미지  where 이미지코드, 상품코드


-- 배송지정보
select order_code, recipient, zipCode, address,detail_address, tel 
	from address;
-- 상품이미지
select image_code, product_code, image 
	from image;
-- 주문정보
select order_code, member_code, order_date, payment_amount, payment_state, delivery_code, buy_confirm_state 
	from `order`;
-- 상품주문정보
select product_code, style_code, `size`, stock, color 
	from orderoption;
-- 주문상품
select order_code, product_code, style_code, `size`, order_count 
	from orderproduct;

select 
order_code ,   
member_code,   
order_date,     	
payment_amount, 
payment_state,	 
delivery_code, 	
buy_confirm_state   
from `order` where order_code = 10001 and member_code=111111 ;

 select  order_code, member_code, member_id, order_date, payment_amount, payment_state, delivery_code, buy_confirm_state, recipient, zipCode, address, detail_address, tel, product_code, product_name, style_code, `size`, order_count, product_main_image from vw_myOrderData where member_id='aaa';

-- - 예진_ 나의 문의사항 뷰 --
create or replace view  vw_myQnA as
select 
q.board_code ,
q.member_code ,
m.member_id ,
q.product_code ,
pd.product_name ,
q.title ,
q.content ,
q.regist_date 
from qna as q 
left join product as pd on q.product_code =pd. product_code 
left join member as m on q.member_code =m.member_code ;
-- -------예진 나의 상품후기리스트 뷰----------------------
create or replace view  vw_myReview as
select 
rv.board_code,
rv.order_code,
rv.title, 
rv.content,
rv.regist_date,
od.member_code ,
m.member_id,
od.order_date ,
od.payment_amount ,
od.payment_state ,
od.delivery_code ,
od.buy_confirm_state,
op.product_code ,
op.style_code ,
op.`size` ,
odop.color ,
pd.product_name ,
pd.brand_code ,
pd.gender ,
pd.product_category_code,
pd.material,
pd.season,
pd.made_date,
pd.sell_Price,
b.brand_name,
p.product_main_image,
rvi.image_code,
rvi.image
	from review as rv 
	left join `order` as od on rv.order_code =od.order_code 
	left join orderproduct as op on od.order_code =op.order_code 
	left join orderoption as odop on op.product_code =odop.product_code 
	left join product as pd on odop.product_code =pd.product_category_code 
	left join brand as b on pd.brand_code =b.brand_code
	left join category c on pd.product_category_code =c.product_category_code 
	left join productpost as p on pd.product_code =p.product_code
	left join reviewimage as rvi on rv.board_code =rvi.board_code 
	left join member m on od.member_code =m.member_code; where member_id ='aaa';
	
-- 	--------------------------------------------------------------------------------------

select * from product;
-- ---예진_ 마이페이지  나의주문내역 확인용  뷰   최종-------------------------------------------------------------------------------------------------------------------------------------------------------
create or replace view  vw_myOrderData as
select 
od.order_code  , 			-- 주문코드   
od.member_code,   			-- 회원코드
m.member_id,
od.order_date,    		 	-- 주문일
od.payment_amount,  		-- 결제금액
od.payment_state,	 		-- 결제여부
od.delivery_code, 	 		-- 배송코드
od.buy_confirm_state  ,		-- 구매확정여부
adr.recipient, 				-- 받는사람
adr.zipCode, 				-- 우편번호
adr.address,				-- 주소
adr.detail_address, 		-- 상세주소
adr.tel,  					-- 연락처
opd.product_code ,			-- 상품코드
pd.product_name,			-- 상품명
opd.style_code ,			-- 스타일코드
opd.`size` ,				-- 사이즈
opd.order_count, 			-- 재고
pdpost.product_main_image  -- 상품대표이미지
from `order` as od 
left join address  as adr on od.order_code = adr.order_code  
left join  orderproduct as opd on od.order_code =opd.order_code
left join orderOption as op on opd.product_code =op.product_code and opd.product_code = op.product_code and opd.style_code =op.style_code and opd.`size` =op.`size` 
left join  productPost as pdpost on op.product_code  = pdpost.product_code left join product as pd on op.product_code = pd.product_code left join member as m on od.member_code =m.member_code ;
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- ---예진_ 마이페이지  나의주문내역 확인용  뷰 연습-------------------------------------------------------------------------------------------------------------------------------------------------------
select 
order_code,   
member_code, 
order_date, 
payment_amount,
payment_state, 
delivery_code, 
buy_confirm_state, 
recipient, 
zipCode, 
address, 
detail_address, 
tel, 
vw.product_code, 
product_name,
style_code, 
`size`, 
order_count, 
product_main_image 
from vw_myOrderData  as vw left join product as pd on op.product_code = pd.product_code ;




-- 1. 마이페이지 정보 확인용 뷰_ 예진----------------------------------------------------------------------------------------------------------------------------------------
create or replace view  vw_mypageData as
	select md.member_id, md.member_pwd,md.member_name, if((md.gender)=true,'여','남') as gender,md.birthday,md.email,md.tel,md.zipCode,md.address,md.detail_address,
		   m.point,m.cumulative_buy_amount,g.grade, m.signUp_date -- 탈퇴여부 뺌
from memberdetail  md left join member m  on md.member_id =m.member_id  left join grade g on m.grade_code =g.grade_code ;
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 3. 예진_ 마이페이지 나의 문의사항 뷰 최종(안씀-> 써야함 ㅠ 안그러면 매개변수 두개넣어야해)) -------------------------------------------------------------------------------------------------------------------------------------------------------
create or replace view  vw_myQnA as
select 
q.board_code ,      -- 게시판코드
q.member_code ,	    -- 회원코드
m.member_id ,		-- 회원ID
q.product_code ,	-- 상품코드
pd.product_name ,	-- 상품명
pp.product_main_image, -- 상품대표이미지
q.title ,			-- 문의제목
q.content ,			-- 문의내용
q.reply ,			-- 답글
q.regist_date 		-- 등록일
from qna as q 
left join product as pd on q.product_code =pd. product_code 
left join member as m on q.member_code =m.member_code 
left join productpost as pp on q.product_code = pp.product_code;
-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------
