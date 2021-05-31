-- 배송지정보
select order_code, recipient, zipCode, address,detail_address, tel 
	from address;
-- 등급
select authority_code, authority 
	from authority;
-- 브렌드
select brand_code, brand_name 
	from brand;
-- 장바구니
select cart_code, member_code, `size`, product_code, style_code, count 
	from cart;
-- 카테고리
select product_category_code, category 
	from category;
-- 사원정보
select emp_number, emp_name, authority_code, emp_id, emp_pwd, email, tel_number 
	from employee;
-- 등급
select grade_code, grade 
	from grade;
-- 상품이미지
select image_code, product_code, image 
	from image;
-- 회원정보
select member_code, member_id, `point`, cumulative_buy_amount, grade_code, quit_state, signUp_date 
	from `member`;
-- 회원상세정보
select member_id, member_pwd, member_name, gender, birthday, email, tel, zipCode, address, detail_address 
	from memberdetail;
-- 공지사항
select board_code, emp_number, title, content, regist_date 
	from notice;
-- 주문정보
select order_code, member_code, order_date, payment_amount, payment_state, delivery_code, buy_confirm_state 
	from `order`;
-- 상품주문정보
select product_code, style_code, `size`, stock, color 
	from orderoption;
-- 주문상품
select order_code, product_code, style_code, `size`, order_count 
	from orderproduct;
-- 상품정보
select product_code, product_name, brand_code, gender, product_category_code, material, 
		season, made_date, costPrice, sell_Price, regist_date, 
		cumulative_regist_count, cumulative_sell_count, emp_number 
	from product;
-- 상품게시글
select product_code, product_main_image, content 
	from productpost;
-- 상품문의게시판
select board_code, member_code, product_code, title, content, reply, regist_date 
	from qna;
-- 상품후기게시판
select board_code, order_code, title, content, regist_date 
	from review;
-- 후기이미지
select image_code, board_code, image 
	from reviewimage;
