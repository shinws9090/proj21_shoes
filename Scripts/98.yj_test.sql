desc memberdetail ;
select  * from memberdetail;
select  * from  member;


select * from vw_myorderdata where order_code=10006;

select member_code, member_id, `point`, cumulative_buy_amount, grade_code, quit_state, signUp_date from member;

	select member_id, member_pwd, member_name, gender, birthday, email, tel, zipCode, address, detail_address 
	from memberDetail where member_id = '회원아이디';
	
select member_id, member_pwd, member_name, gender, birthday, email, tel, zipCode, address, detail_address 
	from memberDetail where member_id ='회원아이디'
	
-- 
select  member_id, passmember_pwd
from memberdetail where member_id ='123' and member_pwd = password('123123');


	
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


select * from member;

-- 
-- 상품문의게시판  - 회원아이디로 검색쓰
select board_code, -- 게시판코드
member_code,	   -- 회원코드 (member)
product_code,  		-- 상품코드 (productPost) 상품게시글에이:ㅆ음
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