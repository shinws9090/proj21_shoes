package proj21_shoes.commend;

public class ProductSelectCommend {
	private String gender;
	private int brandCode;
	private int productCategoryCode;
	private String main;
	private int page;
	private int limit;
	
	
	
	public int getLimit() {
		return (page+1)*8;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String getMain() {
		return main;
	}
	public void setMain(String main) {
		this.main = main;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public int getBrandCode() {
		return brandCode;
	}
	public void setBrandCode(int brandCode) {
		this.brandCode = brandCode;
	}
	public int getProductCategoryCode() {
		return productCategoryCode;
	}
	public void setProductCategoryCode(int productCategoryCode) {
		this.productCategoryCode = productCategoryCode;
	}
	
	
	
}
