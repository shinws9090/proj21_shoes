package proj21_shoes.commend;

public class OrderCommend { // 주문정보

	private int orderCode; // 주문코드
	private String orderDate; // 주문일
	private int paymentAmount; // 결제금액
	private boolean buyConfirmState; // 구매확정여부

	public int getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(int orderCode) {
		this.orderCode = orderCode;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public int getPaymentAmount() {
		return paymentAmount;
	}

	public void setPaymentAmount(int paymentAmount) {
		this.paymentAmount = paymentAmount;
	}

	public boolean isBuyConfirmState() {
		return buyConfirmState;
	}

	public void setBuyConfirmState(boolean buyConfirmState) {
		this.buyConfirmState = buyConfirmState;
	}

	@Override
	public String toString() {
		return String.format("OrderCommend [orderCode=%s, orderDate=%s, paymentAmount=%s, buyConfirmState=%s]",
				orderCode, orderDate, paymentAmount, buyConfirmState);
	}
	
}
