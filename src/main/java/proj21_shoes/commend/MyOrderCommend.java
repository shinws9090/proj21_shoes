package proj21_shoes.commend;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;

import proj21_shoes.service.MyReviewService;

public class MyOrderCommend {

	private int orderCode; // 주문코드
	private int membeCode; // 회원코드
	private String memberId; // 회원아이디
	@DateTimeFormat(pattern = "yyyyMMdd")
	private LocalDate orderDate; // 주문일
	@DateTimeFormat(pattern = "yyyyMMdd")
	private LocalDate cancelDate; // 주문취소일

	private int paymentAmount; // 결제금액
	private int paymentState; // 결제여부
	private boolean cancelState; // 주문취소여부
	private String deliveryCode; // 배송코드(송장번호)
	private boolean buyConfirmState; // 구매확정여부
	private String recipient; // 받는사람
	private String zipCode; // 우편번호
	private String address; // 주소
	private String detailAddress; // 상세주소
	private String tel; // 연락처
	private int productCode; // 상품코드
	private String productName; // 상품명
	private int styleCode; // 스타일코드
	private int size; // 사이즈
	private int orderCount; // 주문수량
	private String productMainImage; // 상품 대표이미지
	private String color; // 색상
	private String payOX; // 결제여부리턴
	private String buyConfirmOX;// 구매확정여부 리턴
	private String orderReview; // 주문한거 리뷰했냐

	int selPrice; // 1개당 판매금액
	int allSelPrice; // 주문수량*판매가
	double gradeHal; // 등급할인금액
	double point; // 포인트 사용금액
	double lastPrice;// 최종결제금액

	// private String buyConfirmView;// 미입금시 구매확정 못하게
//	private String reViewOX;

	// MyReviewCommend myOrderReViewOX =
	// reviewService.selectMyReviewByOrderCode(orderCode); //주문코드로 ox

//	

	public MyOrderCommend() {
		// TODO Auto-generated constructor stub
	}

	public LocalDate getCancelDate() {
		return cancelDate;
	}

	public void setCancelDate(LocalDate cancelDate) {
		this.cancelDate = cancelDate;
	}

	public void setOrderReview(String orderReview) {
		this.orderReview = orderReview;
	}

	public MyOrderCommend(int orderCode) {
		super();
		this.orderCode = orderCode;
	}

	public boolean isByConfirmState() {
		return buyConfirmState;
	}

	public String getBuyConfirmOX() {
		if (buyConfirmState == true) {
			return "확정완료";
		} else {
			return null;
		}
	}

//	public String getReViewOX() {
//		if(test != 0) {
//			return"후기작성완료";
//		}else {
//			return null;
//		}
//	}

	public String getColor() {
		return color;
	}

	public int getPaymentState() {
		return paymentState;
	}

	public void setPaymentState(int paymentState) {
		this.paymentState = paymentState;
	}

	public boolean isCancelState() {
		return cancelState;
	}

	public void setCancelState(boolean cancelState) {
		this.cancelState = cancelState;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public void setByConfirmState(boolean buyConfirmState) {
		this.buyConfirmState = buyConfirmState;
	}

	public String getAllSelPrice() {
		String allSelPrice2 = java.text.NumberFormat.getInstance().format(allSelPrice);
		return allSelPrice2;
	}

	public void setAllSelPrice(int allSelPrice) {
		this.allSelPrice = allSelPrice;
	}

	public String getSelPrice() {
		String selPrice2 = java.text.NumberFormat.getInstance().format(selPrice);
		return selPrice2;
	}

	public int getLastPriceInt() {

		return (int) lastPrice;
	}

	public void setSelPrice(int selPrice) {
		this.selPrice = selPrice;
	}

	public String getGradeHal() {
		String gradeHal2 = java.text.NumberFormat.getInstance().format(gradeHal);
		return gradeHal2;
	}

	public void setGardeHal(double gardeHal) {
		this.gradeHal = gardeHal;
	}

	public String getLastPrice() {
		String lastPrice2 = java.text.NumberFormat.getInstance().format(lastPrice);
		return lastPrice2;
	}

	public void setLastPrice(double lastPrice) {
		this.lastPrice = lastPrice;
	}

	public String getPoint() {
		String point2 = java.text.NumberFormat.getInstance().format(point);
		return point2;
	}

	public double getPointInt() {

		return point;
	}

	public void setPoint(double point) {
		this.point = point;
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

	public String getPayOX() {
		if (paymentState == 1) {
			return "입금완료";
		} else {
			return null;
		}
	}

	public String getPaymentAmount() {
		String paymentAmount2 = java.text.NumberFormat.getInstance().format(paymentAmount);
		return paymentAmount2;
	}

	public int getPaymentAmountInt() {
		int paymentAmount3 = paymentAmount;
		return paymentAmount3;
	}

	public void setPaymentAmount(int paymentAmount) {
		this.paymentAmount = paymentAmount;
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

	public MyOrderCommend(int orderCode, int membeCode, String memberId, LocalDate orderDate, LocalDate cancelDate,
			int paymentAmount, int paymentState, boolean cancelState, String deliveryCode, boolean buyConfirmState,
			String recipient, String zipCode, String address, String detailAddress, String tel, int productCode,
			String productName, int styleCode, int size, int orderCount, String productMainImage, String color,
			String payOX, String buyConfirmOX, String orderReview, int selPrice, double gradeHal, double point,
			double lastPrice) {
		super();
		this.orderCode = orderCode;
		this.membeCode = membeCode;
		this.memberId = memberId;
		this.orderDate = orderDate;
		this.cancelDate = cancelDate;
		this.paymentAmount = paymentAmount;
		this.paymentState = paymentState;
		this.cancelState = cancelState;
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
		this.color = color;
		this.payOX = payOX;
		this.buyConfirmOX = buyConfirmOX;
		this.orderReview = orderReview;
		this.selPrice = selPrice;
		this.gradeHal = gradeHal;
		this.point = point;
		this.lastPrice = lastPrice;
	}

	@Override
	public String toString() {
		return String.format(
				"MyOrderCommend [orderCode=%s, membeCode=%s, memberId=%s, orderDate=%s, cancelDate=%s, paymentAmount=%s, paymentState=%s, cancelState=%s, deliveryCode=%s, buyConfirmState=%s, recipient=%s, zipCode=%s, address=%s, detailAddress=%s, tel=%s, productCode=%s, productName=%s, styleCode=%s, size=%s, orderCount=%s, productMainImage=%s, color=%s, payOX=%s, buyConfirmOX=%s, orderReview=%s, selPrice=%s, gradeHal=%s, point=%s, lastPrice=%s]",
				orderCode, membeCode, memberId, orderDate, cancelDate, paymentAmount, paymentState, cancelState,
				deliveryCode, buyConfirmState, recipient, zipCode, address, detailAddress, tel, productCode,
				productName, styleCode, size, orderCount, productMainImage, color, payOX, buyConfirmOX, orderReview,
				selPrice, gradeHal, point, lastPrice);
	}

}
