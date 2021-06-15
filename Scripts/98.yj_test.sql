desc memberdetail ;
select  * from memberdetail;
select  * from  member;

select member_code, member_id, `point`, cumulative_buy_amount, grade_code, quit_state, signUp_date from member;

	select member_id, member_pwd, member_name, gender, birthday, email, tel, zipCode, address, detail_address 
	from memberDetail where member_id = '회원아이디';
	
select member_id, member_pwd, member_name, gender, birthday, email, tel, zipCode, address, detail_address 
	from memberDetail where member_id ='회원아이디'
	
-- 
select  member_id, member_pwd
from memberdetail where member_id ='11' and member_pwd ='111111';

	
	
	-- 등급, 회원상세정보, 회원정보
insert into grade values
	(1,'등급');


insert into memberdetail values
	('회원아이디2','회원비밀번호','회원이름',true,now(),'이메일','연락처','12345','주소','상세주소');

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




	