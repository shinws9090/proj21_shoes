package proj21_shoes.dto;

import java.time.LocalDateTime;

public class Order { 					// 	주문정보
	
	private int orderCode; 				// 	주문코드
	private Member memberCode;			// 	회원코드
	private LocalDateTime orderDate; 	//  주문일
	private int paymentAmount; 			// 	결제금액
	private boolean paymentState; 		// 	결제여부
	private String deliveryCode; 		// 	배송코드
	private boolean buyConfirmState; 	// 	구매확정여부

	public int getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(int orderCode) {
		this.orderCode = orderCode;
	}

	public Member getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(Member memberCode) {
		this.memberCode = memberCode;
	}

	public LocalDateTime getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(LocalDateTime orderDate) {
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

	@Override
	public String toString() {
		return String.format(
				"Order [orderCode=%s, memberCode=%s, orderDate=%s, paymentAmount=%s, paymentState=%s, deliveryCode=%s, buyConfirmState=%s]",
				orderCode, memberCode, orderDate, paymentAmount, paymentState, deliveryCode, buyConfirmState);
	}

}
