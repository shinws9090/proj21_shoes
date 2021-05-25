package proj21_shoes.dto;

public class Image {
	private int imageCode; //이미지코드
	private int productCode; //상품코드
	private String image; //이미지이름
	
	
	public int getImageCode() {
		return imageCode;
	}
	public void setImageCode(int imageCode) {
		this.imageCode = imageCode;
	}
	public int getProductCode() {
		return productCode;
	}
	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	@Override
	public String toString() {
		return String.format("Image [imageCode=%s, productCode=%s, image=%s]", imageCode, productCode, image);
	}
	
	
}
