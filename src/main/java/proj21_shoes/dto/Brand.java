package proj21_shoes.dto;

public class Brand { //브랜드 구분
	private int brandCode; //브랜드 코드
	private String brandName; //브랜드명
	
	public int getBrandCode() {
		return brandCode;
	}
	public void setBrandCode(int brandCode) {
		this.brandCode = brandCode;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	@Override
	public String toString() {
		return String.format("Brand [brandCode=%s, brandName=%s]", brandCode, brandName);
	}
	
	
}
