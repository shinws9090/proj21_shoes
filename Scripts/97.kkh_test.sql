SELECT * FROM memberdetail;

insert into memberdetail() values ("test1", 1234, "홍길동1", 1, 20000101, "test1@test.com", 01012341234, 12345, "대구", "우리집");

select * from product where product_code = 22222;

select * from orderproduct;

select * from `order`;

select * from `member`;

select * from employee;

select * from product;
select * from productpost;

select * from brand;

select * from category;

insert into product (product_code, product_name, brand_code, gender, product_category_code, material, season, made_date, costPrice, sell_Price, regist_date, cumulative_regist_count, cumulative_sell_count, emp_number)
	values (22225, "운동화", "3", "남", "888", "가죽", "겨울", now(), 50000, 80000, now(), 1, 1, 101);
	
insert into product (product_name, made_date, costPrice, sell_Price, regist_date)
	values ("운동화", now(), 50000, 80000, now());


delete from product where product_code = 5;

update product set product_name = "구두", brand_code = 2, gender = "여", product_category_code = 1, material = "가죽", season = "가을", made_date = 20210101, costPrice = 60000, sell_Price = 70000, regist_date = 20210505, cumulative_regist_count = 10, cumulative_sell_count = 2, emp_number = 1
 where product_code = 5;
 
insert all
		into product (product_code, product_name, brand_code, gender, product_category_code, material, season, made_date, costPrice, sell_Price, regist_date, cumulative_regist_count, cumulative_sell_count, emp_number)
		values (99, "신발임", "2", "남", "1", "가죽", "겨울", 20210101, 440000, 550000, 20210101, 1, 1, 1)
		into productpost (product_code, product_main_image, content)
		values (10, "1", "내용");
		
		;

insert into productpost values (2, null, null);
			
			
select *
		from product p
		join brand b on p.brand_code = b.brand_code
		join category c on c.product_category_code =p.product_category_code
		join productpost p2 on p2.product_code = p.product_code;		
		
	
	
select * from  productPost;
select * from  image;

select pp.product_code, pp.product_main_image, pp.content, im.image_code, im.product_code, im.image from  productPost pp join image im on pp.product_code = im.product_code;

product_code, product_main_image, content, image_code, product_code, image
