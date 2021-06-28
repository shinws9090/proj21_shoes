-- 각 기능 수행시 필요한 뷰 붙여넣어주세용!


-- 1. 예진_마이페이지 나의 회원정보 뷰----------------------------------------------------------------------------------------------------------------------------------------
create or replace view  vw_mypageData as
	select md.member_id, 						-- 회원아이디
	md.member_pwd,								-- 비밀번호
	md.member_name,								-- 회원이름	
	if((md.gender)=true,'여','남') as gender,	-- 회원성별
	md.birthday,								-- 생년월일
	md.email,									-- 이메일
	md.tel,md.zipCode,							-- 우편번호
	md.address,									-- 주소
	md.detail_address,							-- 상세주소
	m.point,									-- 포인트
	m.cumulative_buy_amount,					-- 누적구매금액
	g.grade, 									-- 등급
	m.signUp_date 								-- 가입일자					
from memberdetail  md 							
left join member m  on md.member_id =m.member_id  
left join grade g on m.grade_code =g.grade_code ;
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------


-- 2. 예진_ 마이페이지  나의주문내역  뷰-------------------------------------------------------------------------------------------------------------------------------------------------------
create or replace view  vw_myOrderData as
select 
od.order_code  , 			-- 주문코드   
od.member_code,   			-- 회원코드
m.member_id,				-- 회원 아이디
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
op.color ,					-- 컬러
opd.order_count, 			-- 주문수량
pdpost.product_main_image   -- 상품대표이미지
from `order` as od 
left join address  as adr on od.order_code = adr.order_code  
left join  orderproduct as opd on od.order_code =opd.order_code
left join orderOption as op on opd.product_code =op.product_code and opd.product_code = op.product_code and opd.style_code =op.style_code and opd.`size` =op.`size` 
left join  productPost as pdpost on op.product_code  = pdpost.product_code 
left join product as pd on op.product_code = pd.product_code 
left join member as m on od.member_code =m.member_code ;
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- 4. 예진_ 마이페이지 나의 상품/일반문의내역 뷰 (뷰 안만들면 매개변수 두개넣어야해ㅜ)) -------------------------------------------------------------------------------------------------------------------------------------------------------
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

-- 5.-------예진_ 마이페이지 나의 상품후기리스트 뷰--------------------------------------------------------------------------------------------------------------------------
create or replace view  vw_myReview as
select 
rv.board_code , 		-- 게시판코드
od.order_code,			-- 주문코드
o.product_code ,		-- 상품코드
rv.title ,				-- 제목
rv.content ,			-- 내용
rv.regist_date ,		-- 작성일
riv.image,				-- 후기이미지
riv.image_code ,		-- 후기이미지코드
od.member_code,			-- 회원코드
od.order_date ,			-- 주문일
od.payment_amount ,		-- 결제금액
od.payment_state ,		-- 결제상태
od.delivery_code ,		-- 배송코드
od.buy_confirm_state,	-- 주문확정상태
o.style_code ,			-- 스타일코드
o.`size` ,				-- 사이즈
o.order_count ,			-- 주문수량
op.color ,				-- 색상
p.product_name,			-- 상품명
p.brand_code ,			-- 브랜드코드
p.gender ,				-- 성별
p.product_category_code ,	-- 상품 카테고리코드
p.material ,				-- 소재
p.season ,					-- 계절
p.made_date ,				-- 생산일
p.sell_Price,				-- 판매가
p2.product_main_image,		-- 상품대표이미지
b.brand_name ,				-- 브랜드명
b.brand_eng_name, 			-- 브랜드 영문명
c.category ,				-- 종류
m.member_id					-- 회원ID 
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

-- --------------------------------------------------------------------------------------------------------------------------------
/*create or replace view  vw_myReview as
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
		left join member m on od.member_code =m.member_code;*/
	
-- 	--------------------------------------------------------------------------------------------------------------------------------------------------

