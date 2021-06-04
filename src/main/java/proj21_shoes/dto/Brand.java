package proj21_shoes.dto;

public class Brand { // 브랜드 구분
	private int brandCode; // 브랜드 코드
	private String brandName; // 브랜드명
	private String brandEngName; // 브랜드영어명

	public Brand() {
		// TODO Auto-generated constructor stub
	}

	public Brand(int brandCode) {
		this.brandCode = brandCode;
	}

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

	public String getBrandEngName() {
		return brandEngName;
	}

	public void setBrandEngName(String brandEngName) {
		this.brandEngName = brandEngName;
	}

	@Override
	public String toString() {
		return String.format("Brand [brandCode=%s, brandName=%s, brandEngName=%s]", brandCode, brandName, brandEngName);
	}

}
