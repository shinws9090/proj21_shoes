
select *
from product p 
join brand b on p.brand_code = b.brand_code 
join category c on c.product_category_code =p.product_category_code
join employee e on e.emp_number = p.emp_number
join authority a2 on e.authority_code = a2.authority_code
join productpost p2 on p2.product_code = p.product_code;
	order by regist_date desc
	limit 5;
left join image i on i.product_code = p.product_code;
where p.product_code = 55555;




call productByAll();

select * from orderoption; where product_code = 1;
select * from orderoption where product_code =22222 and style_code =3;

select * from brand;
select * from product where product_code =1;

select cart_code, member_code, `size`, product_code, style_code, count
	from cart 
	where cart_code = 1;
	where member_code = 111111;

insert into cart(member_code, `size`, product_code, style_code, count) values
	(111111,270,11111,1,20);
update cart 
	set count = count+1
	where member_code =111111 and `size` =270 and product_code = 11111 and style_code =1;

delete from cart where cart_code = 6;


select * from `order`;

insert into `order`(member_code, order_date, payment_amount) values
	(111111,now(),1000);

select last_insert_id();

select * from orderproduct;
select * from address a;

insert into orderproduct(order_code, product_code, style_code, `size`, order_count) values
	()
	
insert into image(product_code,image) values
	(22222,'Timberland (1).jpg'),
	(22222,'Timberland (10).jpg'),
	(22222,'Timberland (11).jpg'),
	(22222,'Timberland (12).jpg'),
	(22222,'Timberland (13).jpg'),
	(22222,'Timberland (2).jpg'),
	(22222,'Timberland (3).jpg'),
	(22222,'Timberland (4).jpg'),
	(22222,'Timberland (5).jpg'),
	(22222,'Timberland (6).jpg'),
	(22222,'Timberland (7).jpg'),
	(22222,'Timberland (8).jpg'),
	(22222,'Timberland (9).jpg');

update orderoption set stock= stock- 1
		where product_code = 22222 and style_code =2 and size = 280;
select * from orderoption ;

INSERT INTO sinabro.orderoption
(product_code, style_code, `size`, stock, color)
VALUES(22222, 2, 270, 0, 'yelloㅇw');

select * from cart c2 ;

delete from cart 
		where product_code = 11111 and style_code =#{orderOption.styleCode} and size = #{orderOption.size}
		
select * from member ;

select * from brand ;where brand_eng_name like concat('n','%');

insert into product values
	(11112,'카시안 다크브라운 샌들',1,'men',555,'천연(소)가죽','S/S',now(),178000,124900,now(),1,1,101),
	(11113,'카시안 다크브라운 샌들',1,'men',555,'천연(소)가죽','S/S',now(),178000,124900,now(),1,1,101),
	(11114,'카시안 다크브라운 샌들',1,'men',555,'천연(소)가죽','S/S',now(),178000,124900,now(),1,1,101),
	(11115,'카시안 다크브라운 샌들',1,'men',555,'천연(소)가죽','S/S',now(),178000,124900,now(),1,1,101),
	(11116,'카시안 다크브라운 샌들',1,'men',555,'천연(소)가죽','S/S',now(),178000,124900,now(),1,1,101),
	(11117,'카시안 다크브라운 샌들',1,'men',555,'천연(소)가죽','S/S',now(),178000,124900,now(),1,1,101),
	(11118,'카시안 다크브라운 샌들',1,'men',555,'천연(소)가죽','S/S',now(),178000,124900,now(),1,1,101),
	(11119,'카시안 다크브라운 샌들',1,'men',555,'천연(소)가죽','S/S',now(),178000,124900,now(),1,1,101),
	(11120,'카시안 다크브라운 샌들',1,'men',555,'천연(소)가죽','S/S',now(),178000,124900,now(),1,1,101),
	(11121,'카시안 다크브라운 샌들',1,'men',555,'천연(소)가죽','S/S',now(),178000,124900,now(),1,1,101),
	(11122,'카시안 다크브라운 샌들',1,'men',555,'천연(소)가죽','S/S',now(),178000,124900,now(),1,1,101),
	(11123,'카시안 다크브라운 샌들',1,'men',555,'천연(소)가죽','S/S',now(),178000,124900,now(),1,1,101),
	(11124,'카시안 다크브라운 샌들',1,'men',555,'천연(소)가죽','S/S',now(),178000,124900,now(),1,1,101),
	(11125,'카시안 다크브라운 샌들',1,'men',555,'천연(소)가죽','S/S',now(),178000,124900,now(),1,1,101),
	(11126,'카시안 다크브라운 샌들',1,'men',555,'천연(소)가죽','S/S',now(),178000,124900,now(),1,1,101),
	(11127,'카시안 다크브라운 샌들',1,'men',555,'천연(소)가죽','S/S',now(),178000,124900,now(),1,1,101),
	(11128,'카시안 다크브라운 샌들',1,'men',555,'천연(소)가죽','S/S',now(),178000,124900,now(),1,1,101),
	(11129,'카시안 다크브라운 샌들',1,'men',555,'천연(소)가죽','S/S',now(),178000,124900,now(),1,1,101),
	(11130,'카시안 다크브라운 샌들',1,'men',555,'천연(소)가죽','S/S',now(),178000,124900,now(),1,1,101),
	(11131,'카시안 다크브라운 샌들',1,'men',555,'천연(소)가죽','S/S',now(),178000,124900,now(),1,1,101),
	(11132,'카시안 다크브라운 샌들',1,'men',555,'천연(소)가죽','S/S',now(),178000,124900,now(),1,1,101),
	(11133,'카시안 다크브라운 샌들',1,'men',555,'천연(소)가죽','S/S',now(),178000,124900,now(),1,1,101);

select *
		from product p
		join brand b on p.brand_code = b.brand_code
		join category c on c.product_category_code =p.product_category_code
		left join productpost p2 on p2.product_code = p.product_code
		where p.product_code = 11111
		limit (3*12);
	
insert into productpost values
	(11112,'DrMartin1-main.jpg','닥터마틴 샌들'),
	(11113,'DrMartin1-main.jpg','닥터마틴 샌들'),
	(11114,'DrMartin1-main.jpg','닥터마틴 샌들'),
	(11115,'DrMartin1-main.jpg','닥터마틴 샌들'),
	(11116,'DrMartin1-main.jpg','닥터마틴 샌들'),
	(11117,'DrMartin1-main.jpg','닥터마틴 샌들'),
	(11118,'DrMartin1-main.jpg','닥터마틴 샌들'),
	(11119,'DrMartin1-main.jpg','닥터마틴 샌들'),
	(11120,'DrMartin1-main.jpg','닥터마틴 샌들'),
	(11121,'DrMartin1-main.jpg','닥터마틴 샌들'),
	(11122,'DrMartin1-main.jpg','닥터마틴 샌들'),
	(11123,'DrMartin1-main.jpg','닥터마틴 샌들'),
	(11124,'DrMartin1-main.jpg','닥터마틴 샌들'),
	(11125,'DrMartin1-main.jpg','닥터마틴 샌들'),
	(11126,'DrMartin1-main.jpg','닥터마틴 샌들'),
	(11127,'DrMartin1-main.jpg','닥터마틴 샌들'),
	(11128,'DrMartin1-main.jpg','닥터마틴 샌들'),
	(11129,'DrMartin1-main.jpg','닥터마틴 샌들'),
	(11130,'DrMartin1-main.jpg','닥터마틴 샌들'),
	(11131,'DrMartin1-main.jpg','닥터마틴 샌들'),
	(11132,'DrMartin1-main.jpg','닥터마틴 샌들'),
	(11133,'DrMartin1-main.jpg','닥터마틴 샌들');

delete from qna where board_code=6;
select * from qna ;
UPDATE qna
		SET  title=2222222, content='asdasdasd'
		WHERE board_code=10;
		
select count(*) 		
		from vw_myqna where product_code=11111
		
select *
from review r
		join `order` o on o.order_code = r.order_code
		join `member` m on o.member_code = m.member_code
		join memberdetail m2 on m.member_id = m2.member_id
		left join reviewimage r2 on r.board_code = r2.board_code
		join orderproduct o2 on o.order_code = o2.order_code
		where product_code =11111;
		where r.board_code= 1;
select *
from `order` o
		join orderproduct o2 on o.order_code = o2.order_code
	where member_code=111111 and o2.product_code=11111
	order by order_date desc;

select *
	from review r ;
insert into review(order_code, title, content, regist_date) 
	values (10014,'123','123',now())
	
select last_insert_id();


select * from reviewimage;
-- 후기이미지
INSERT INTO reviewimage 
(board_code, image)
VALUES(0, '');


select m.member_code, m.member_id, m.point, m.cumulative_buy_amount, m.grade_code, m.quit_state, m.signUp_date,g.grade, g.sale_price 
		from member as m left join grade as g on m.grade_code = g.grade_code ;
		where member_id = #{memberId}	