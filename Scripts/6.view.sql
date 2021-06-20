-- 각 기능 수행시 필요한 뷰 붙여넣어주세용!


-- 1. 예진_마이페이지 정보 확인용 뷰----------------------------------------------------------------------------------------------------------------------------------------
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


-- 2. 예진_ 마이페이지  나의주문내역 확인용  뷰-------------------------------------------------------------------------------------------------------------------------------------------------------
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
