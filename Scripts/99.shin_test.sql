
select *
from product p 
join brand b on p.brand_code = b.brand_code 
join category c on c.product_category_code =p.product_category_code
join employee e on e.emp_number = p.emp_number
join authority a2 on e.authority_code = a2.authority_code
join productpost p2 on p2.product_code = p.product_code
left join image i on i.product_code = p.product_code
where p.brand_code = 4;
where p.product_code = 1;




call productByAll();

select * from orderoption where product_code = 1;
select * from orderoption where product_code =22222 and style_code =3;

select * from brand;
select * from product where product_code =1;

