package proj21_shoes.commend;

public class ProductSelectCommend {
	private String gender;
	private int brandCode;
	private int productCategoryCode;
	
	
	
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
	@Override
	public String toString() {
		return String.format("ProductSelectCommend [gender=%s, brandCode=%s, productCategoryCode=%s]", gender,
				brandCode, productCategoryCode);
	}
	
	
	
}
