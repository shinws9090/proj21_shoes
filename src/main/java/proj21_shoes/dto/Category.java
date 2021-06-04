package proj21_shoes.dto;

public class Category { // 카데고리
	private int productCategoryCode; // 상품종류
	private String category; // 종류

	public Category() {
		// TODO Auto-generated constructor stub
	}

	public Category(int productCategoryCode) {
		this.productCategoryCode = productCategoryCode;
	}

	public int getProductCategoryCode() {
		return productCategoryCode;
	}

	public void setProductCategoryCode(int productCategoryCode) {
		this.productCategoryCode = productCategoryCode;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return String.format("Category [productCategoryCode=%s, category=%s]", productCategoryCode, category);
	}

}
