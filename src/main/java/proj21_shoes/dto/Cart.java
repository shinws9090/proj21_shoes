package proj21_shoes.dto;

public class Cart { //장바구니
	private int cartCode;				//장바구니코드
	private Member member;				//회원정보
	private OrderOption orderOption;	//주문상세
	private int count;					//수량

	public int getCartCode() {
		return cartCode;
	}
	public void setCartCode(int cartCode) {
		this.cartCode = cartCode;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public OrderOption getOrderOption() {
		return orderOption;
	}
	public void setOrderOption(OrderOption orderOption) {
		this.orderOption = orderOption;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	@Override
	public String toString() {
		return String.format("Cart [cartCode=%s, member=%s, orderOption=%s, count=%s]", cartCode, member, orderOption,
				count);
	}
	
	
}
