
select *
from product p 
join brand b on p.brand_code = b.brand_code 
join category c on c.product_category_code =p.product_category_code
join employee e on e.emp_number = p.emp_number
join authority a2 on e.authority_code = a2.authority_code
join productpost p2 on p2.product_code = p.product_code
left join image i on i.product_code = p.product_code
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