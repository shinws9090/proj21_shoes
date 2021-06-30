SELECT * FROM memberdetail;

insert into memberdetail() values ("test1", 1234, "홍길동1", 1, 20000101, "test1@test.com", 01012341234, 12345, "대구", "우리집");

select * from product where product_code = 22222;

select * from orderproduct;

select * from gender;

select * from `order`;

select * from `member`;

select * from notice n join employee e on n.emp_number = e.emp_number;

select * from vw_myqna;

select * from vw_myReview;

select * from review;

select emp_number, emp_name, authority_code, emp_id, email, tel_number from employee;

select * from product;
select * from productpost;
select * from image;
select * from employee;

insert into image (product_code, image)
	values (11112, "11112.jpg")
	
update image
		   set image = "11112.jpg"
		 where product_code = 11112;

delete from image
		 where product_code = 11112;		

select brand_code, brand_name, brand_eng_name from brand;

select product_category_code, category from category;

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
		
	
select * from  product;
select * from  productPost;
select * from  image;
select * from  orderOption;
select * from notice;


update orderOption set stock = stock + 900 where product_code = 11111 and style_code = 1 and `size` = 260;

insert into orderoption values(11111, 1, 260, 999, "brown");


select product_code, style_code, `size`, stock, color
  from orderOption
 where product_code = 11111;

insert into orderOption (product_code, style_code, `size`, stock, color)
	 values (11111, 1, 250, 1000, "balck");


select pp.product_code, pp.product_main_image, pp.content, im.image_code, im.product_code, im.image from  productPost pp join image im on pp.product_code = im.product_code;

product_code, product_main_image, content, image_code, product_code, image;


select pp.product_code, p.product_name, pp.product_main_image, pp.content, im.image_code, im.product_code, im.image 
		  from  productPost pp 
		  join image im  on pp.product_code = im.product_code
		  join product p on pp.product_code = p.product_code;
		  
select * from category;

insert into category (product_category_code, category) values (999, "신발");

update category set category = "수정"  where product_category_code = 999;

delete from category where product_category_code = 999;

select * from brand;

insert into brand (brand_code, brand_name, brand_eng_name) values (7, "뉴발란스", "NewBalance");

update brand set brand_name = "뉴발", brand_eng_name ="newBal" where brand_code = 7;

delete from brand where brand_code = 7;

select * from orderoption;

select * from orderoption where product_code = 77777 and style_code = 1 and `size` = 270 and color= "111";

update orderOption set stock = stock + -5000, color= "111" where product_code = 77777 and style_code = 1 and `size` = 270;

update orderOption set style_code = 1, `size` = 270, stock = stock + 500, color= "111" where product_code = 77777;

update orderOption
		   set stock = 100
		 where product_code = 77777 and style_code = 1 and `size` = 270 and color= "111";
			
delete from orderoption where product_code = 77777 and style_code = 1 and `size` = 270 and color= "111";


select * from notice n join employee e on n.emp_number = e.emp_number
		where n.board_code = 1;

select count(board_code) from notice;
select * from notice n join employee e on n.emp_number = e.emp_number limit 10 offset 0;
select count(board_code) from notice n
		where n.board_code > 0;

select * from notice WHERE title LIKE concat('%', "적립금", '%');

insert into notice (emp_number, title, content, regist_date) values (101, "제목", "내용", now());

select * from notice n join employee e on n.emp_number = e.emp_number where n.board_code = 1;
select * from notice n join employee e on n.emp_number = e.emp_number where n.board_code = 1;