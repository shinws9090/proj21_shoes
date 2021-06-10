-- 뷰 붙여넣어주세용!


-- 1. 마이페이지 정보 확인용 뷰_ 예진----------------------------------------------------------------------------------------------------------------------------------------
create or replace view  vw_mypageData as
	select md.member_id, md.member_pwd,md.member_name, if((md.gender)=true,'여','남') as gender,md.birthday,md.email,md.tel,md.zipCode,md.address,md.detail_address,
		   m.point,m.cumulative_buy_amount,g.grade, m.signUp_date -- 탈퇴여부 뺌
from memberdetail  md left join member m  on md.member_id =m.member_id  left join grade g on m.grade_code =g.grade_code ;
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------