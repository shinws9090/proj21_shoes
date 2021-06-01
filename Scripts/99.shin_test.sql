
select * 
from product p 
join brand b on p.brand_code = b.brand_code 
join category c on c.product_category_code =p.product_category_code
join employee e on e.emp_number = p.emp_number
join authority a2 on e.authority_code = a2.authority_code 
left join orderoption o on o.product_code = p.product_code; 


call productByAll();


select * from brand;