
select * from product;

-- 권한 , 직원정보 , 공지사항
insert into authority values
	(1,'권한');
insert into employee values
	(1,'사원명',1,'아이디','비밀번호','이메일','전화번호');
insert into notice values
	(1,1,'제목','내용',now());

-- 브렌드, 카테고리, 상품정보, 상품게시글, 상품이미지, 상품주문정보
insert into brand values
	(1,'나이키');
insert into category values
	(1,'슬리퍼');
insert into product values
	(2,'상품명',1,'여',1,'소재','계절',now(),50000,60000,now(),1,1,1),
	(3,'상품명',1,'아동',1,'소재','계절',now(),50000,60000,now(),1,1,1),
	(4,'상품명',1,'남',1,'소재','계절',now(),50000,60000,now(),1,1,1);
	(1,'상품명',1,'남',1,'소재','계절',now(),50000,60000,now(),1,1,1);
insert into productpost values
	(1,'상품대표이미지','내용');
insert into image values
	(1,1,'이미지'),
	(2,1,'이미지'),
	(3,1,'이미지');
insert into orderoption values
	(1,1,260,1,'색상');


-- 등급, 회원상세정보, 회원정보
insert into grade values
	(1,'등급');
insert into memberdetail values
	('회원아이디','회원비밀번호','회원이름',true,now(),'이메일','연락처','12345','주소','상세주소');
insert into `member` values
	(1,'회원아이디',1000,10000,1,false,now());

-- 상품문의게시판
insert into qna values
	(1,1,1,'제목','내용','답글',now());

-- 장바구니
insert into cart values
	(1,1,260,1,1,20);


-- 주문정보, 배송지정보, 주문상품
insert into `order` values
	(1,1,now(),1000,false,'배송코드',false);
insert into address values
	(1,'받는사람','12345','주소','상세주소','연락처');
insert into orderproduct values
	(1,1,1,260,20);

-- 상품후기게시판, 후기이미지
insert into review values
	(1,1,'제목','내용',now());
insert into reviewimage values
	(1,1,'이미지');