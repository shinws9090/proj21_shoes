package proj21_shoes.dto;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class Product { // 상품정보
	private int productCode; // 상품코드
	private String productName; // 상품명
	private Brand brand; // 브렌드
	private String gender; // 성별
	private Category category; // 카테고리
	private String material; // 소재
	private String season; // 계절
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")	
	private LocalDateTime madeDate; // 제조일
	private int costPrice; // 원가
	private int sellPrice; // 판매가
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")	
	private LocalDateTime registDate; // 등록일
	private int cumulativeRegistCount; // 누적등록수량
	private int cumulativeSellCount; // 누적판매수량
	private Employee employee; // 사원정보(등록자)
	private List<OrderOption> orderOptions; // 상품주문정보(상세정보)
	private ProductPost productPost; // 상품게시글

	public Product() {
		// TODO Auto-generated constructor stub
	}

	public Product(int productCode) {
		this.productCode = productCode;
	}

	public Product(int productCode, String productName, Brand brand, String gender, Category category, String material,
			String season, LocalDateTime madeDate, int costPrice, int sellPrice, LocalDateTime registDate,
			int cumulativeRegistCount, int cumulativeSellCount, Employee employee) {
		this.productCode = productCode;
		this.productName = productName;
		this.brand = brand;
		this.gender = gender;
		this.category = category;
		this.material = material;
		this.season = season;
		this.madeDate = madeDate;
		this.costPrice = costPrice;
		this.sellPrice = sellPrice;
		this.registDate = registDate;
		this.cumulativeRegistCount = cumulativeRegistCount;
		this.cumulativeSellCount = cumulativeSellCount;
		this.employee = employee;
	}

	public int getProductCode() {
		return productCode;
	}

	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
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

	public LocalDateTime getMadeDate() {
		return madeDate;
	}

	public void setMadeDate(LocalDateTime madeDate) {
		this.madeDate = madeDate;
	}

	public int getCostPrice() {
		return costPrice;
	}

	public void setCostPrice(int costPrice) {
		this.costPrice = costPrice;
	}

	public int getSellPrice() {
		return sellPrice;
	}

	public void setSellPrice(int sellPrice) {
		this.sellPrice = sellPrice;
	}

	public LocalDateTime getRegistDate() {
		return registDate;
	}

	public void setRegistDate(LocalDateTime registDate) {
		this.registDate = registDate;
	}

	public int getCumulativeRegistCount() {
		return cumulativeRegistCount;
	}

	public void setCumulativeRegistCount(int cumulativeRegistCount) {
		this.cumulativeRegistCount = cumulativeRegistCount;
	}

	public int getCumulativeSellCount() {
		return cumulativeSellCount;
	}

	public void setCumulativeSellCount(int cumulativeSellCount) {
		this.cumulativeSellCount = cumulativeSellCount;
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

	public ProductPost getProductPost() {
		return productPost;
	}

	public void setProductPost(ProductPost productPost) {
		this.productPost = productPost;
	}

	@Override
	public String toString() {
		return String.format(
				"Product [productCode=%s, productName=%s, brand=%s, gender=%s, category=%s, material=%s, season=%s, madeDate=%s, costPrice=%s, sellPrice=%s, registDate=%s, cumulativeRegistCount=%s, cumulativeSellCount=%s, employee=%s, orderOptions=%s, productPost=%s]",
				productCode, productName, brand, gender, category, material, season, madeDate, costPrice, sellPrice,
				registDate, cumulativeRegistCount, cumulativeSellCount, employee, orderOptions, productPost);
	}

}
