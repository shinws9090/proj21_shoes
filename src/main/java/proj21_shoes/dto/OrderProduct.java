package proj21_shoes.dto;

public class OrderProduct {

	private OrderOption orderOption;
	private int orderCount;
	
	

	public OrderProduct() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrderProduct(OrderOption orderOption, int orderCount) {
		super();
		this.orderOption = orderOption;
		this.orderCount = orderCount;
	}

	public OrderOption getOrderOption() {
		return orderOption;
	}

	public void setOrderOption(OrderOption orderOption) {
		this.orderOption = orderOption;
	}

	public int getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}

	@Override
	public String toString() {
		return String.format("OrderProduct [orderOption=%s, orderCount=%s]", orderOption, orderCount);
	}

}
