package proj21_shoes.commend;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

public class MyOrderCommend {
	private int orderCode;  		//주문코드
	private int membeCode;			//회원코드
	private String memberId;		//회원아이디
	@DateTimeFormat(pattern = "yyyyMMdd")	
	private LocalDate orderDate; 	//주문일
	private int paymentAmount;		//결제금액
	private boolean paymentState; 	//결제여부
	private int deliveryCode;		//배송코드(송장번호)
	private boolean buyConfirmState; //구매확정여부
	private String recipient;		//받는사람
	private String zipCode; 		//우편번호
	private String address; 		//주소
	private String detailAddress;	//상세주소
	private String tel; 			//연락처
	private int productCode;		//상품코드
	private String productName;    //상품명
	private int styleCode;			//스타일코드
	private int size;				//사이즈
	private int orderCount;		//주문수량
	private String productMainImage; //상품 대표이미지
	
	
	public MyOrderCommend() {
		// TODO Auto-generated constructor stub
	}
	
	
	public MyOrderCommend(int orderCode) {
		super();
		this.orderCode = orderCode;
	}
	
	public boolean isByConfirmState() {
		return buyConfirmState;
	}


	public void setByConfirmState(boolean buyConfirmState) {
		this.buyConfirmState = buyConfirmState;
	}


	public MyOrderCommend(String memberId) {
		super();
		this.memberId = memberId;
	}
	public int getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(int orderCode) {
		this.orderCode = orderCode;
	}
	public int getMembeCode() {
		return membeCode;
	}
	public void setMembeCode(int membeCode) {
		this.membeCode = membeCode;
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
	public int getDeliveryCode() {
		return deliveryCode;
	}
	public void setDeliveryCode(int deliveryCode) {
		this.deliveryCode = deliveryCode;
	}
	public String getRecipient() {
		return recipient;
	}
	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
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
	public String getProductMainImage() {
		return productMainImage;
	}
	public void setProductMainImage(String productMainImage) {
		this.productMainImage = productMainImage;
	}


	

	public MyOrderCommend(int orderCode, int membeCode, String memberId, LocalDate orderDate, int paymentAmount,
			boolean paymentState, int deliveryCode, boolean buyConfirmState, String recipient, String zipCode,
			String address, String detailAddress, String tel, int productCode, String productName, int styleCode,
			int size, int orderCount, String productMainImage) {
		super();
		this.orderCode = orderCode;
		this.membeCode = membeCode;
		this.memberId = memberId;
		this.orderDate = orderDate;
		this.paymentAmount = paymentAmount;
		this.paymentState = paymentState;
		this.deliveryCode = deliveryCode;
		this.buyConfirmState = buyConfirmState;
		this.recipient = recipient;
		this.zipCode = zipCode;
		this.address = address;
		this.detailAddress = detailAddress;
		this.tel = tel;
		this.productCode = productCode;
		this.productName = productName;
		this.styleCode = styleCode;
		this.size = size;
		this.orderCount = orderCount;
		this.productMainImage = productMainImage;
	}


	@Override
	public String toString() {
		return String.format(
				"MyOrderCommend [orderCode=%s, membeCode=%s, memberId=%s, orderDate=%s, paymentAmount=%s, paymentState=%s, deliveryCode=%s, buyConfirmState=%s, recipient=%s, zipCode=%s, address=%s, detailAddress=%s, tel=%s, productCode=%s, productName=%s, styleCode=%s, size=%s, orderCount=%s, productMainImage=%s]",
				orderCode, membeCode, memberId, orderDate, paymentAmount, paymentState, deliveryCode, buyConfirmState,
				recipient, zipCode, address, detailAddress, tel, productCode, productName, styleCode, size, orderCount,
				productMainImage);
	}
	

}
