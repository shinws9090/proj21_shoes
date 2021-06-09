package proj21_shoes.dto;

import java.util.Arrays;
import java.util.List;

public class ProductPost { // 상품게시글
	private int productCode; // 상품정보
	private byte[] productMainImage; // 상품대표이미지
	private String content; // 내용
	private List<Image> images; // 상품이미지들

	public ProductPost() {
		// TODO Auto-generated constructor stub
	}

	public ProductPost(int productCode) {
		this.productCode = productCode;
	}

	public ProductPost(int productCode, byte[] productMainImage, String content, List<Image> images) {
		this.productCode = productCode;
		this.productMainImage = productMainImage;
		this.content = content;
		this.images = images;
	}

	public int getProductCode() {
		return productCode;
	}

	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}

	public byte[] getProductMainImage() {
		return productMainImage;
	}

	public void setProductMainImage(byte[] productMainImage) {
		this.productMainImage = productMainImage;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public List<Image> getImages() {
		return images;
	}

	public void setImages(List<Image> images) {
		this.images = images;
	}

	@Override
	public String toString() {
		return String.format("ProductPost [productCode=%s, productMainImage=%s, content=%s, images=%s]", productCode,
				Arrays.toString(productMainImage), content, images);
	}

}
