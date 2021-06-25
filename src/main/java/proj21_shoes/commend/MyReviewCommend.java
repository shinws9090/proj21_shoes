package proj21_shoes.commend;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

public class MyReviewCommend {
	private int boardCode;
	private int orderCode;
	private String title;
	private String content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")	
	private LocalDate registDate;
	private int memberCode;
	private String  memberId;
	@DateTimeFormat(pattern = "yyyy-MM-dd")	
	private LocalDate  orderDate;
	private int paymentAmount;
	private boolean  paymentState;
	private String  deliveryCode;
	private boolean  buyConfirmState;
	private int productCode;
	private int styleCode;
	private int size;
	private int orderCount;
	private String  color;
	private String  productName;
	private int brandCode;
	private boolean gender;
	private int productCategoryCode;
	private String  material;
	private String  season;
	@DateTimeFormat(pattern = "yyyy-MM-dd")	
	private LocalDate  madeDate;
	private int sellPrice;
	private String  brandName;
	private String productMainImage;
	private int imageCode;
	private String  image;
	
	
	public MyReviewCommend() {
		// TODO Auto-generated constructor stub
	}
	
	public int getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}

	public int getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(int orderCode) {
		this.orderCode = orderCode;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public LocalDate getRegistDate() {
		return registDate;
	}

	public void setRegistDate(LocalDate registDate) {
		this.registDate = registDate;
	}

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public LocalDate getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(LocalDate orderDate) {
		this.orderDate = orderDate;
	}

	public int getPaymentAmount() {
		return paymentAmount;
	}

	public void setPaymentAmount(int paymentAmount) {
		this.paymentAmount = paymentAmount;
	}

	public boolean isPaymentState() {
		return paymentState;
	}

	public void setPaymentState(boolean paymentState) {
		this.paymentState = paymentState;
	}

	public String getDeliveryCode() {
		return deliveryCode;
	}

	public void setDeliveryCode(String deliveryCode) {
		this.deliveryCode = deliveryCode;
	}

	public boolean isBuyConfirmState() {
		return buyConfirmState;
	}

	public void setBuyConfirmState(boolean buyConfirmState) {
		this.buyConfirmState = buyConfirmState;
	}

	public int getProductCode() {
		return productCode;
	}

	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}

	public int getStyleCode() {
		return styleCode;
	}

	public void setStyleCode(int styleCode) {
		this.styleCode = styleCode;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public int getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getBrandCode() {
		return brandCode;
	}

	public void setBrandCode(int brandCode) {
		this.brandCode = brandCode;
	}

	public boolean isGender() {
		return gender;
	}

	public void setGender(boolean gender) {
		this.gender = gender;
	}

	public int getProductCategoryCode() {
		return productCategoryCode;
	}

	public void setProductCategoryCode(int productCategoryCode) {
		this.productCategoryCode = productCategoryCode;
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

	public LocalDate getMadeDate() {
		return madeDate;
	}

	public void setMadeDate(LocalDate madeDate) {
		this.madeDate = madeDate;
	}

	public int getSellPrice() {
		return sellPrice;
	}

	public void setSellPrice(int sellPrice) {
		this.sellPrice = sellPrice;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getProductMainImage() {
		return productMainImage;
	}

	public void setProductMainImage(String productMainImage) {
		this.productMainImage = productMainImage;
	}

	public int getImageCode() {
		return imageCode;
	}

	public void setImageCode(int imageCode) {
		this.imageCode = imageCode;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public MyReviewCommend(int boardCode, int orderCode, String title, String content, LocalDate registDate,
			int memberCode, String memberId, LocalDate orderDate, int paymentAmount, boolean paymentState,
			String deliveryCode, boolean buyConfirmState, int productCode, int styleCode, int size, int orderCount,
			String color, String productName, int brandCode, boolean gender, int productCategoryCode, String material,
			String season, LocalDate madeDate, int sellPrice, String brandName, String productMainImage, int imageCode,
			String image) {
		super();
		this.boardCode = boardCode;
		this.orderCode = orderCode;
		this.title = title;
		this.content = content;
		this.registDate = registDate;
		this.memberCode = memberCode;
		this.memberId = memberId;
		this.orderDate = orderDate;
		this.paymentAmount = paymentAmount;
		this.paymentState = paymentState;
		this.deliveryCode = deliveryCode;
		this.buyConfirmState = buyConfirmState;
		this.productCode = productCode;
		this.styleCode = styleCode;
		this.size = size;
		this.orderCount = orderCount;
		this.color = color;
		this.productName = productName;
		this.brandCode = brandCode;
		this.gender = gender;
		this.productCategoryCode = productCategoryCode;
		this.material = material;
		this.season = season;
		this.madeDate = madeDate;
		this.sellPrice = sellPrice;
		this.brandName = brandName;
		this.productMainImage = productMainImage;
		this.imageCode = imageCode;
		this.image = image;
	}
	@Override
	public String toString() {
		return String.format(
				"MyReviewCommend [boardCode=%s, orderCode=%s, title=%s, content=%s, registDate=%s, memberCode=%s, memberId=%s, orderDate=%s, paymentAmount=%s, paymentState=%s, deliveryCode=%s, buyConfirmState=%s, productCode=%s, styleCode=%s, size=%s, orderCount=%s, color=%s, productName=%s, brandCode=%s, gender=%s, productCategoryCode=%s, material=%s, season=%s, madeDate=%s, sellPrice=%s, brandName=%s, productMainImage=%s, imageCode=%s, image=%s]",
				boardCode, orderCode, title, content, registDate, memberCode, memberId, orderDate, paymentAmount,
				paymentState, deliveryCode, buyConfirmState, productCode, styleCode, size, orderCount, color,
				productName, brandCode, gender, productCategoryCode, material, season, madeDate, sellPrice, brandName,
				productMainImage, imageCode, image);
	}
	
	
	
}
