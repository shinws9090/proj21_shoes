desc memberdetail ;
select  * from memberdetail;
select  * from  member;

select member_code, member_id, `point`, cumulative_buy_amount, grade_code, quit_state, signUp_date from member;

	select member_id, member_pwd, member_name, gender, birthday, email, tel, zipCode, address, detail_address 
	from memberDetail where member_id = '회원아이디';
	
select member_id, member_pwd, member_name, gender, birthday, email, tel, zipCode, address, detail_address 
	from memberDetail where member_id ='회원아이디'
	
	
	-- 등급, 회원상세정보, 회원정보
insert into grade values
	(1,'등급');


insert into memberdetail values
	('회원아이디2','회원비밀번호','회원이름',true,now(),'이메일','연락처','12345','주소','상세주소');

-- 회원정보
INSERT INTO member
(member_id, point, cumulative_buy_amount, grade_code, quit_state, signUp_date)
VALUES('11', 1, 1, 1, 1, '11-11-11 11:11:11');


-- 상품문의게시판
insert into qna values
	(1,1,1,'제목','내용','답글',now());

-- 장바구니
insert into cart values
	(1,1,260,1,1,20);

	