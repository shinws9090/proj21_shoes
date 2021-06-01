-- 배송지정보
INSERT INTO sinabro.address
(order_code, recipient, zipCode, address, detail_address, tel)
VALUES(0, '', '', '', '', '');

-- 권한
INSERT INTO sinabro.authority
(authority_code, authority)
VALUES(0, '');

-- 브랜드
INSERT INTO sinabro.brand
(brand_name, brand_eng_name)
VALUES('', '');

-- 장바구니

INSERT INTO sinabro.cart
(member_code, `size`, product_code, style_code, count)
VALUES(0, 0, 0, 0, 0);

-- 카테고리
INSERT INTO sinabro.category
(category)
VALUES('');

-- 직원정보
INSERT INTO sinabro.employee
(emp_name, authority_code, emp_id, emp_pwd, email, tel_number)
VALUES('', 0, '', '', '', '');

-- 회원등급
INSERT INTO sinabro.grade
(grade_code, grade)
VALUES(0, '');

-- 상품이미지
INSERT INTO sinabro.image
(product_code, image)
VALUES(0, '');
-- 회원정보
INSERT INTO sinabro.`member`
(member_id, `point`, cumulative_buy_amount, grade_code, quit_state, signUp_date)
VALUES('', 0, 0, 0, 0, '');

-- 회원상세정보
INSERT INTO sinabro.memberdetail
(member_id, member_pwd, member_name, gender, birthday, email, tel, zipCode, address, detail_address)
VALUES('', '', '', 0, '', '', '', '', '', '');

-- 공지사항
INSERT INTO sinabro.notice
(emp_number, title, content, regist_date)
VALUES(0, '', '', '');

-- 주문정보
INSERT INTO sinabro.`order`
(member_code, order_date, payment_amount, payment_state, delivery_code, buy_confirm_state)
VALUES(0, '', 0, 0, '', 0);

-- 상품주문정보
INSERT INTO sinabro.orderoption
(product_code, style_code, `size`, stock, color)
VALUES(0, 0, 0, 0, '');

-- 주문상품

INSERT INTO sinabro.orderproduct
(order_code, product_code, style_code, `size`, order_count)
VALUES(0, 0, 0, 0, 0);

-- 상품정보
INSERT INTO sinabro.product
(product_name, brand_code, gender, product_category_code, material, season, made_date, costPrice, sell_Price, regist_date, cumulative_regist_count, cumulative_sell_count, emp_number)
VALUES('', 0, '', 0, '', '', '', 0, 0, '', 0, 0, 0);

-- 상품게시글
INSERT INTO sinabro.productpost
(product_code, product_main_image, content)
VALUES(0, ?, '');

-- 상품문의게시판
INSERT INTO sinabro.qna
(member_code, product_code, title, content, reply, regist_date)
VALUES(0, 0, '', '', '', '');

-- 상품후기게시판
INSERT INTO sinabro.review
(order_code, title, content, regist_date)
VALUES(0, '', '', '');

-- 후기이미지
INSERT INTO sinabro.reviewimage
(board_code, image)
VALUES(0, '');












