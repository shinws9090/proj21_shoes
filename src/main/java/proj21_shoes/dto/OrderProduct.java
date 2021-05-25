package proj21_shoes.dto;

public class OrderProduct {
	
	private Order order;
	private OrderOption orderOption;
	private int orderCount;
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
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
		return String.format("OrderProduct [order=%s, orderOption=%s, orderCount=%s]", order, orderOption, orderCount);
	}
	
	
}
