package proj21_shoes.dto;

import java.time.LocalDateTime;
import java.util.List;

public class Product { //상품정보
	private int product_code; //상품코드
	private String product_name; //상품명
	private Brand brand; //브렌드
	private String gender; //성별
	private Category category; //카테고리
	private String material; //소재
	private String season; //계절
	private LocalDateTime made_date; //제조일
	private int costPrice; //원가
	private int sell_Price; //판매가
	private LocalDateTime regist_date; //등록일
	private int cumulative_regist_count; //누적등록수량
	private int cumulative_sell_count; //누적판매수량
	private Employee employee; //사원정보(등록자)
	private List<OrderOption> orderOptions; //상품주문정보(상세정보)
	private ProductPost productPost; //상품게시글
	
	public ProductPost getProductPost() {
		return productPost;
	}
	public void setProductPost(ProductPost productPost) {
		this.productPost = productPost;
	}
	public int getProduct_code() {
		return product_code;
	}
	public void setProduct_code(int product_code) {
		this.product_code = product_code;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public Brand getBrand() {
		return brand;
	}
	public void setBrand(Brand brand) {
		this.brand = brand;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public String getMaterial() {
		return material;
	}
	public void setMaterial(String material) {
		this.material = material;
	}
	public String getSeason() {
		return season;
	}
	public void setSeason(String season) {
		this.season = season;
	}
	public LocalDateTime getMade_date() {
		return made_date;
	}
	public void setMade_date(LocalDateTime made_date) {
		this.made_date = made_date;
	}
	public int getCostPrice() {
		return costPrice;
	}
	public void setCostPrice(int costPrice) {
		this.costPrice = costPrice;
	}
	public int getSell_Price() {
		return sell_Price;
	}
	public void setSell_Price(int sell_Price) {
		this.sell_Price = sell_Price;
	}
	public LocalDateTime getRegist_date() {
		return regist_date;
	}
	public void setRegist_date(LocalDateTime regist_date) {
		this.regist_date = regist_date;
	}
	public int getCumulative_regist_count() {
		return cumulative_regist_count;
	}
	public void setCumulative_regist_count(int cumulative_regist_count) {
		this.cumulative_regist_count = cumulative_regist_count;
	}
	public int getCumulative_sell_count() {
		return cumulative_sell_count;
	}
	public void setCumulative_sell_count(int cumulative_sell_count) {
		this.cumulative_sell_count = cumulative_sell_count;
	}
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public List<OrderOption> getOrderOptions() {
		return orderOptions;
	}
	public void setOrderOptions(List<OrderOption> orderOptions) {
		this.orderOptions = orderOptions;
	}
	@Override
	public String toString() {
		return String.format(
				"Product [product_code=%s, product_name=%s, brand=%s, gender=%s, category=%s, material=%s, season=%s, made_date=%s, costPrice=%s, sell_Price=%s, regist_date=%s, cumulative_regist_count=%s, cumulative_sell_count=%s, employee=%s, orderOptions=%s, productPost=%s]",
				product_code, product_name, brand, gender, category, material, season, made_date, costPrice, sell_Price,
				regist_date, cumulative_regist_count, cumulative_sell_count, employee, orderOptions, productPost);
	}
	
	
	
	
	
	
	
}
