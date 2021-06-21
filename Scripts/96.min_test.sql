select pp.product_code, pp.product_main_image, pp.content, im.image_code, im.product_code, im.image 
		  from  productPost pp 
		  join image im 
		    on pp.product_code = im.product_code;
		   
		   select *
		from product p
		join brand b on p.brand_code = b.brand_code
		join category c on c.product_category_code =p.product_category_code
		join productpost p2 on p2.product_code = p.product_code;		


	
	
select * from review r ;

	
select *
from review r
join `order` o2 on o2.order_code = r.order_code;

select *
from `order` o 
join `member` m on m.member_code = o.member_code;

select m.member_id 
from `member` m 
join memberdetail m2 on m.member_id = m2.member_id;

select *
from `member` m 
join memberdetail m2 on m.member_id = m2.member_id;

select *
from review r 
join memberdetail m on m.member_id = r.m


select r.board_code, r.order_code, r2.image, r.title, r.regist_date
from review r
join reviewimage r2 on r.board_code = r2.board_code;

order memberdetail member 

select * from review r;
select * from `order` o ;

select r.board_code, r.order_code, r2.image, r.title, m2.member_id, r.regist_date
from review r
join `order` o on o.order_code = r.order_code
join `member` m on o.member_code = m.member_code 
join memberdetail m2 on m.member_id = m2.member_id
join reviewimage r2 on r.board_code = r2.board_code
where m.member_id = 'bbb';
