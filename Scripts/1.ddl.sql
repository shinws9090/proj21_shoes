-- 신발쇼핑몰
DROP SCHEMA IF EXISTS sinabro;

-- 신발쇼핑몰
CREATE SCHEMA sinabro;

-- 상품정보
CREATE TABLE sinabro.product (
	product_code            INT         NOT NULL COMMENT '상품코드', -- 상품코드
	product_name            VARCHAR(30) NOT NULL COMMENT '상품명', -- 상품명
	brand_code              INT         NULL     COMMENT '브랜드코드', -- 브랜드코드
	gender                  VARCHAR(10) NULL     COMMENT '성별', -- 성별
	product_category_code   INT         NULL     COMMENT '상품종류코드', -- 상품종류코드
	material                VARCHAR(20) NULL     COMMENT '소재', -- 소재
	season                  VARCHAR(10) NULL     COMMENT '계절', -- 계절
	made_date               DATETIME    NOT NULL COMMENT '제조일', -- 제조일
	costPrice               INT         NOT NULL COMMENT '원가', -- 원가
	sell_Price              INT         NOT NULL COMMENT '판매가', -- 판매가
	regist_date             DATETIME    NOT NULL COMMENT '등록일', -- 등록일
	cumulative_regist_count INT         NULL     COMMENT '누적등록수량', -- 누적등록수량
	cumulative_sell_count   INT         NULL     COMMENT '누적판매수량', -- 누적판매수량
	emp_number              INT         NULL     COMMENT '사원번호(등록자)' -- 사원번호(등록자)
)
COMMENT '상품정보';

-- 상품정보
ALTER TABLE sinabro.product
	ADD CONSTRAINT PK_product -- 상품정보 기본키
		PRIMARY KEY (
			product_code -- 상품코드
		);

ALTER TABLE sinabro.product
	MODIFY COLUMN product_code INT NOT NULL AUTO_INCREMENT COMMENT '상품코드';

-- 회원정보
CREATE TABLE sinabro.member (
	member_code           INT         NOT NULL COMMENT '회원코드', -- 회원코드
	member_id             VARCHAR(50) NOT NULL COMMENT '회원아이디', -- 회원아이디
	point                 INT         NULL     COMMENT '포인트', -- 포인트
	cumulative_buy_amount INT         NULL     COMMENT '누적구매금액', -- 누적구매금액
	grade_code            INT         NULL     COMMENT '등급코드', -- 등급코드
	quit_state            BOOLEAN     NULL     COMMENT '탈퇴여부', -- 탈퇴여부
	signUp_date           DATETIME    NULL     COMMENT '가입일' -- 가입일
)
COMMENT '회원정보';

-- 회원정보
ALTER TABLE sinabro.member
	ADD CONSTRAINT PK_member -- 회원정보 기본키
		PRIMARY KEY (
			member_code -- 회원코드
		);

ALTER TABLE sinabro.member
	MODIFY COLUMN member_code INT NOT NULL AUTO_INCREMENT COMMENT '회원코드';

-- 직원정보
CREATE TABLE sinabro.employee (
	emp_number     INT         NOT NULL COMMENT '사원번호', -- 사원번호
	emp_name       VARCHAR(20) NOT NULL COMMENT '사원명', -- 사원명
	authority_code INT         NULL     COMMENT '권한코드', -- 권한코드
	emp_id         VARCHAR(50) NOT NULL COMMENT '직원아이디', -- 직원아이디
	emp_pwd        VARCHAR(41) NOT NULL COMMENT '직원비밀번호', -- 직원비밀번호
	email          VARCHAR(30) NULL     COMMENT '이메일', -- 이메일
	tel_number     VARCHAR(41) NULL     COMMENT '전화번호' -- 전화번호
)
COMMENT '직원정보';

-- 직원정보
ALTER TABLE sinabro.employee
	ADD CONSTRAINT PK_employee -- 직원정보 기본키
		PRIMARY KEY (
			emp_number -- 사원번호
		);

ALTER TABLE sinabro.employee
	MODIFY COLUMN emp_number INT NOT NULL AUTO_INCREMENT COMMENT '사원번호';

-- 주문정보
CREATE TABLE sinabro.order (
	order_code        INT         NOT NULL COMMENT '주문코드', -- 주문코드
	member_code       INT         NULL     COMMENT '회원코드', -- 회원코드
	order_date        DATETIME    NOT NULL COMMENT '주문일', -- 주문일
	payment_amount    INT         NOT NULL COMMENT '결제금액', -- 결제금액
	payment_state     BOOL    	  NOT NULL DEFAULT false COMMENT '결제여부', -- 결제여부
	delivery_code     VARCHAR(50) NULL     COMMENT '배송코드', -- 배송코드
	buy_confirm_state BOOL        NOT NULL DEFAULT false COMMENT '구매확정여부' -- 구매확정여부
)
COMMENT '주문정보';

-- 주문정보
ALTER TABLE sinabro.order
	ADD CONSTRAINT PK_order -- 주문정보 기본키
		PRIMARY KEY (
			order_code -- 주문코드
		);

ALTER TABLE sinabro.order
	MODIFY COLUMN order_code INT NOT NULL AUTO_INCREMENT COMMENT '주문코드';

-- 주문상품
CREATE TABLE sinabro.orderProduct (
	order_code   INT NOT NULL COMMENT '주문코드', -- 주문코드
	product_code INT NOT NULL COMMENT '상품코드', -- 상품코드
	style_code   INT NULL     COMMENT '스타일코드', -- 스타일코드
	size         INT NULL     COMMENT '사이즈', -- 사이즈
	order_count  INT NULL     COMMENT '주문수량' -- 주문수량
)
COMMENT '주문상품';

-- 주문상품
ALTER TABLE sinabro.orderProduct
	ADD CONSTRAINT PK_orderProduct -- 주문상품 기본키
		PRIMARY KEY (
			order_code,   -- 주문코드
			product_code,  -- 상품코드
			style_code,  -- 스타일코드
			size  -- 사이즈
		);

-- 상품주문정보
CREATE TABLE sinabro.orderOption (
	product_code INT         NOT NULL COMMENT '상품코드', -- 상품코드
	style_code   INT         NOT NULL COMMENT '스타일코드', -- 스타일코드
	size         INT         NOT NULL COMMENT '사이즈', -- 사이즈
	stock        INT         NULL     COMMENT '재고', -- 재고
	color        VARCHAR(30) NULL     COMMENT '색상' -- 색상
)
COMMENT '상품주문정보';

-- 상품주문정보
ALTER TABLE sinabro.orderOption
	ADD CONSTRAINT PK_orderOption -- 상품주문정보 기본키
		PRIMARY KEY (
			product_code, -- 상품코드
			style_code,   -- 스타일코드
			size          -- 사이즈
		);

-- 상품후기게시판
CREATE TABLE sinabro.review (
	board_code  INT           NOT NULL COMMENT '게시판코드', -- 게시판코드
	order_code  INT           NOT NULL COMMENT '주문코드', -- 주문코드
	product_code INT          NOT NULL COMMENT '상품코드', -- 상품코드
	title       VARCHAR(500)  NOT NULL COMMENT '제목', -- 제목
	content     VARCHAR(2000) NULL     COMMENT '내용', -- 내용
	regist_date DATETIME      NULL     COMMENT '등록일' -- 등록일
)
COMMENT '상품후기게시판';

-- 상품후기게시판
ALTER TABLE sinabro.review
	ADD CONSTRAINT PK_review -- 상품후기게시판 기본키
		PRIMARY KEY (
			board_code -- 게시판코드
		);

ALTER TABLE sinabro.review
	MODIFY COLUMN board_code INT NOT NULL AUTO_INCREMENT COMMENT '게시판코드';

-- 상품문의게시판
CREATE TABLE sinabro.qna (
	board_code   INT           NOT NULL COMMENT '게시판코드', -- 게시판코드
	member_code  INT           NOT NULL COMMENT '회원코드', -- 회원코드
	product_code INT           NULL     COMMENT '상품코드', -- 상품코드
	title        VARCHAR(500)  NOT NULL COMMENT '제목', -- 제목
	content      VARCHAR(2000) NULL     COMMENT '내용', -- 내용
	reply        VARCHAR(2000) NULL     COMMENT '답글', -- 답글
	regist_date  DATETIME      NULL     COMMENT '등록일' -- 등록일
)
COMMENT '상품문의게시판';

-- 상품문의게시판
ALTER TABLE sinabro.qna
	ADD CONSTRAINT PK_qna -- 상품문의게시판 기본키
		PRIMARY KEY (
			board_code -- 게시판코드
		);

ALTER TABLE sinabro.qna
	MODIFY COLUMN board_code INT NOT NULL AUTO_INCREMENT COMMENT '게시판코드';

-- 카테고리
CREATE TABLE sinabro.category (
	product_category_code INT         NOT NULL COMMENT '상품종류코드', -- 상품종류코드
	category              VARCHAR(20) NOT NULL COMMENT '종류' -- 종류
)
COMMENT '카테고리';

-- 카테고리
ALTER TABLE sinabro.category
	ADD CONSTRAINT PK_category -- 카테고리 기본키
		PRIMARY KEY (
			product_category_code -- 상품종류코드
		);

ALTER TABLE sinabro.category
	MODIFY COLUMN product_category_code INT NOT NULL AUTO_INCREMENT COMMENT '상품종류코드';

-- 공시사항
CREATE TABLE sinabro.notice (
	board_code  INT           NOT NULL COMMENT '게시판코드', -- 게시판코드
	emp_number  INT           NULL     COMMENT '사원번호', -- 사원번호
	title       VARCHAR(500)  NOT NULL COMMENT '제목', -- 제목
	content     VARCHAR(2000) NULL     COMMENT '내용', -- 내용
	regist_date DATETIME      NULL     COMMENT '등록일' -- 등록일
)
COMMENT '공시사항';

-- 공시사항
ALTER TABLE sinabro.notice
	ADD CONSTRAINT PK_notice -- 공시사항 기본키
		PRIMARY KEY (
			board_code -- 게시판코드
		);

ALTER TABLE sinabro.notice
	MODIFY COLUMN board_code INT NOT NULL AUTO_INCREMENT COMMENT '게시판코드';

-- 회원장바구니
CREATE TABLE sinabro.cart (
	cart_code    INT NOT NULL COMMENT '장바구니코드', -- 장바구니코드
	member_code  INT NOT NULL COMMENT '회원코드', -- 회원코드
	size         INT NOT NULL COMMENT '사이즈', -- 사이즈
	product_code INT NOT NULL COMMENT '상품코드', -- 상품코드
	style_code   INT NOT NULL COMMENT '스타일코드', -- 스타일코드
	count        INT NOT NULL COMMENT '수량' -- 수량
)
COMMENT '회원장바구니';

-- 회원장바구니
ALTER TABLE sinabro.cart
	ADD CONSTRAINT PK_cart -- 회원장바구니 기본키
		PRIMARY KEY (
			cart_code -- 장바구니코드
		);

ALTER TABLE sinabro.cart
	MODIFY COLUMN cart_code INT NOT NULL AUTO_INCREMENT COMMENT '장바구니코드';

-- 배송지정보
CREATE TABLE sinabro.address (
	order_code     INT          NOT NULL COMMENT '주문코드', -- 주문코드
	recipient      VARCHAR(20)  NOT NULL COMMENT '받는사람', -- 받는사람
	zipCode        VARCHAR(5)   NOT NULL COMMENT '우편번호', -- 우편번호
	address        VARCHAR(500) NOT NULL COMMENT '주소', -- 주소
	detail_address VARCHAR(500) NOT NULL COMMENT '상세주소', -- 상세주소
	tel            VARCHAR(20)  NOT NULL COMMENT '연락처' -- 연락처
)
COMMENT '배송지정보';

-- 배송지정보
ALTER TABLE sinabro.address
	ADD CONSTRAINT PK_address -- 배송지정보 기본키
		PRIMARY KEY (
			order_code -- 주문코드
		);

-- 상품게시글
CREATE TABLE sinabro.productPost (
	product_code       INT           NOT NULL COMMENT '상품코드', -- 상품코드
	product_main_image VARCHAR(500)   NOT NULL COMMENT '상품대표이미지', -- 상품대표이미지
	content            VARCHAR(2000) NULL     COMMENT '내용' -- 내용
)
COMMENT '상품게시글';

-- 상품게시글
ALTER TABLE sinabro.productPost
	ADD CONSTRAINT PK_productPost -- 상품게시글 기본키
		PRIMARY KEY (
			product_code -- 상품코드
		);

-- 브랜드구분
CREATE TABLE sinabro.brand (
	brand_code     INT         NOT NULL COMMENT '브랜드코드', -- 브랜드코드
	brand_name     VARCHAR(20) NOT NULL COMMENT '브랜드명', -- 브랜드명
	brand_eng_name VARCHAR(50) NOT NULL COMMENT '브랜드영어명' -- 브랜드영어명
)
COMMENT '브랜드구분';

-- 브랜드구분
ALTER TABLE sinabro.brand
	ADD CONSTRAINT PK_brand -- 브랜드구분 기본키
		PRIMARY KEY (
			brand_code -- 브랜드코드
		);

ALTER TABLE sinabro.brand
	MODIFY COLUMN brand_code INT NOT NULL AUTO_INCREMENT COMMENT '브랜드코드';

-- 회원상세정보
CREATE TABLE sinabro.memberDetail (
	member_id      VARCHAR(50)  NOT NULL COMMENT '회원아이디', -- 회원아이디
	member_pwd     VARCHAR(41)  NOT NULL COMMENT '회원비밀번호', -- 회원비밀번호
	member_name    VARCHAR(20)  NOT NULL COMMENT '회원이름', -- 회원이름
	gender         BOOLEAN      NOT NULL COMMENT '성별', -- 성별
	birthday       DATETIME     NULL     COMMENT '생년월일', -- 생년월일
	email          VARCHAR(50)  NULL     COMMENT '이메일', -- 이메일
	tel            VARCHAR(20)  NULL     COMMENT '연락처', -- 연락처
	zipCode        VARCHAR(5)   NULL     COMMENT '우편번호', -- 우편번호
	address        VARCHAR(500) NULL     COMMENT '주소', -- 주소
	detail_address VARCHAR(500) NULL     COMMENT '상세주소' -- 상세주소
)
COMMENT '회원상세정보';

-- 회원상세정보
ALTER TABLE sinabro.memberDetail
	ADD CONSTRAINT PK_memberDetail -- 회원상세정보 기본키
		PRIMARY KEY (
			member_id -- 회원아이디
		);

-- 권한
CREATE TABLE sinabro.authority (
	authority_code INT           NOT NULL COMMENT '권한코드', -- 권한코드
	authority      VARCHAR(20)   NOT NULL COMMENT '권한' -- 권한
)
COMMENT '권한';

-- 권한
ALTER TABLE sinabro.authority
	ADD CONSTRAINT PK_authority -- 권한 기본키
		PRIMARY KEY (
			authority_code -- 권한코드
		);

-- 등급
CREATE TABLE sinabro.grade (
	grade_code INT         NOT NULL COMMENT '등급코드', -- 등급코드
	grade      VARCHAR(50) NOT NULL COMMENT '등급' -- 등급
)
COMMENT '등급';

-- 등급
ALTER TABLE sinabro.grade
	ADD CONSTRAINT PK_grade -- 등급 기본키
		PRIMARY KEY (
			grade_code -- 등급코드
		);

-- 상품이미지
CREATE TABLE sinabro.image (
	image_code   INT         NOT NULL COMMENT '이미지코드', -- 이미지코드
	product_code INT         NOT NULL COMMENT '상품코드', -- 상품코드
	image        VARCHAR(500) NOT NULL COMMENT '이미지' -- 이미지
)
COMMENT '상품이미지';

-- 상품이미지
ALTER TABLE sinabro.image
	ADD CONSTRAINT PK_image -- 상품이미지 기본키
		PRIMARY KEY (
			image_code -- 이미지코드
		);

ALTER TABLE sinabro.image
	MODIFY COLUMN image_code INT NOT NULL AUTO_INCREMENT COMMENT '이미지코드';

-- 후기이미지
CREATE TABLE sinabro.reviewImage (
	image_code INT         NOT NULL COMMENT '이미지코드', -- 이미지코드
	board_code INT         NOT NULL COMMENT '게시판코드', -- 게시판코드
	image      VARCHAR(500) NOT NULL COMMENT '이미지' -- 이미지
)
COMMENT '후기이미지';

-- 후기이미지
ALTER TABLE sinabro.reviewImage
	ADD CONSTRAINT PK_reviewImage -- 후기이미지 기본키
		PRIMARY KEY (
			image_code -- 이미지코드
		);

ALTER TABLE sinabro.reviewImage
	MODIFY COLUMN image_code INT NOT NULL AUTO_INCREMENT COMMENT '이미지코드';

-- 상품정보
ALTER TABLE sinabro.product
	ADD CONSTRAINT FK_employee_TO_product -- 직원정보 -> 상품정보
		FOREIGN KEY (
			emp_number -- 사원번호(등록자)
		)
		REFERENCES sinabro.employee ( -- 직원정보
			emp_number -- 사원번호
		);

-- 상품정보
ALTER TABLE sinabro.product
	ADD CONSTRAINT FK_category_TO_product -- 카테고리 -> 상품정보
		FOREIGN KEY (
			product_category_code -- 상품종류코드
		)
		REFERENCES sinabro.category ( -- 카테고리
			product_category_code -- 상품종류코드
		);

-- 상품정보
ALTER TABLE sinabro.product
	ADD CONSTRAINT FK_brand_TO_product -- 브랜드구분 -> 상품정보
		FOREIGN KEY (
			brand_code -- 브랜드코드
		)
		REFERENCES sinabro.brand ( -- 브랜드구분
			brand_code -- 브랜드코드
		);

-- 회원정보
ALTER TABLE sinabro.member
	ADD CONSTRAINT FK_memberDetail_TO_member -- 회원상세정보 -> 회원정보
		FOREIGN KEY (
			member_id -- 회원아이디
		)
		REFERENCES sinabro.memberDetail ( -- 회원상세정보
			member_id -- 회원아이디
		)
		ON DELETE CASCADE
		ON UPDATE CASCADE;

-- 회원정보
ALTER TABLE sinabro.member
	ADD CONSTRAINT FK_grade_TO_member -- 등급 -> 회원정보
		FOREIGN KEY (
			grade_code -- 등급코드
		)
		REFERENCES sinabro.grade ( -- 등급
			grade_code -- 등급코드
		);

-- 직원정보
ALTER TABLE sinabro.employee
	ADD CONSTRAINT FK_authority_TO_employee -- 권한 -> 직원정보
		FOREIGN KEY (
			authority_code -- 권한코드
		)
		REFERENCES sinabro.authority ( -- 권한
			authority_code -- 권한코드
		);

-- 주문정보
ALTER TABLE sinabro.order
	ADD CONSTRAINT FK_member_TO_order -- 회원정보 -> 주문정보
		FOREIGN KEY (
			member_code -- 회원코드
		)
		REFERENCES sinabro.member ( -- 회원정보
			member_code -- 회원코드
		);

-- 주문상품
ALTER TABLE sinabro.orderProduct
	ADD CONSTRAINT FK_order_TO_orderProduct -- 주문정보 -> 주문상품
		FOREIGN KEY (
			order_code -- 주문코드
		)
		REFERENCES sinabro.order ( -- 주문정보
			order_code -- 주문코드
		)
		ON DELETE CASCADE
		ON UPDATE CASCADE;

-- 주문상품
ALTER TABLE sinabro.orderProduct
	ADD CONSTRAINT FK_orderOption_TO_orderProduct -- 상품주문정보 -> 주문상품
		FOREIGN KEY (
			product_code, -- 상품코드
			style_code,   -- 스타일코드
			size          -- 사이즈
		)
		REFERENCES sinabro.orderOption ( -- 상품주문정보
			product_code, -- 상품코드
			style_code,   -- 스타일코드
			size          -- 사이즈
		)
		ON DELETE CASCADE
		ON UPDATE CASCADE;

-- 상품주문정보
ALTER TABLE sinabro.orderOption
	ADD CONSTRAINT FK_product_TO_orderOption -- 상품정보 -> 상품주문정보
		FOREIGN KEY (
			product_code -- 상품코드
		)
		REFERENCES sinabro.product ( -- 상품정보
			product_code -- 상품코드
		)
		ON DELETE CASCADE
		ON UPDATE CASCADE;

-- 상품후기게시판
ALTER TABLE sinabro.review
	ADD CONSTRAINT FK_order_TO_review -- 주문정보 -> 상품후기게시판
		FOREIGN KEY (
			order_code -- 주문코드
		)
		REFERENCES sinabro.order ( -- 주문정보
			order_code -- 주문코드
		)
		ON DELETE CASCADE
		ON UPDATE CASCADE;

-- 상품문의게시판
ALTER TABLE sinabro.qna
	ADD CONSTRAINT FK_member_TO_qna -- 회원정보 -> 상품문의게시판
		FOREIGN KEY (
			member_code -- 회원코드
		)
		REFERENCES sinabro.member ( -- 회원정보
			member_code -- 회원코드
		)
		ON DELETE CASCADE
		ON UPDATE CASCADE;

-- 공시사항
ALTER TABLE sinabro.notice
	ADD CONSTRAINT FK_employee_TO_notice -- 직원정보 -> 공시사항
		FOREIGN KEY (
			emp_number -- 사원번호
		)
		REFERENCES sinabro.employee ( -- 직원정보
			emp_number -- 사원번호
		);

-- 회원장바구니
ALTER TABLE sinabro.cart
	ADD CONSTRAINT FK_member_TO_cart -- 회원정보 -> 회원장바구니
		FOREIGN KEY (
			member_code -- 회원코드
		)
		REFERENCES sinabro.member ( -- 회원정보
			member_code -- 회원코드
		)
		ON DELETE CASCADE
		ON UPDATE CASCADE;

-- 회원장바구니
ALTER TABLE sinabro.cart
	ADD CONSTRAINT FK_orderOption_TO_cart -- 상품주문정보 -> 회원장바구니
		FOREIGN KEY (
			product_code, -- 상품코드
			style_code,   -- 스타일코드
			size          -- 사이즈
		)
		REFERENCES sinabro.orderOption ( -- 상품주문정보
			product_code, -- 상품코드
			style_code,   -- 스타일코드
			size          -- 사이즈
		)
		ON DELETE CASCADE
		ON UPDATE CASCADE;

-- 배송지정보
ALTER TABLE sinabro.address
	ADD CONSTRAINT FK_order_TO_address -- 주문정보 -> 배송지정보
		FOREIGN KEY (
			order_code -- 주문코드
		)
		REFERENCES sinabro.order ( -- 주문정보
			order_code -- 주문코드
		)
		ON DELETE CASCADE
		ON UPDATE CASCADE;

-- 상품게시글
ALTER TABLE sinabro.productPost
	ADD CONSTRAINT FK_product_TO_productPost -- 상품정보 -> 상품게시글
		FOREIGN KEY (
			product_code -- 상품코드
		)
		REFERENCES sinabro.product ( -- 상품정보
			product_code -- 상품코드
		)
		ON DELETE CASCADE
		ON UPDATE CASCADE;

-- 상품이미지
ALTER TABLE sinabro.image
	ADD CONSTRAINT FK_productPost_TO_image -- 상품게시글 -> 상품이미지
		FOREIGN KEY (
			product_code -- 상품코드
		)
		REFERENCES sinabro.productPost ( -- 상품게시글
			product_code -- 상품코드
		)
		ON DELETE CASCADE
		ON UPDATE CASCADE;

-- 후기이미지
ALTER TABLE sinabro.reviewImage
	ADD CONSTRAINT FK_review_TO_reviewImage -- 상품후기게시판 -> 후기이미지
		FOREIGN KEY (
			board_code -- 게시판코드
		)
		REFERENCES sinabro.review ( -- 상품후기게시판
			board_code -- 게시판코드
		)
		ON DELETE CASCADE
		ON UPDATE CASCADE;