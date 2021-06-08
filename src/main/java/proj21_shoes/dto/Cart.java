package proj21_shoes.dto;

public class Cart { //장바구니
	private int cartCode;				//장바구니코드
	private Member member;				//회원정보
	private int productCode;			//상품코드
	private int styleCode;				//스타일코드
	private int size;
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
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + productCode;
		result = prime * result + size;
		result = prime * result + styleCode;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Cart other = (Cart) obj;
		if (productCode != other.productCode)
			return false;
		if (size != other.size)
			return false;
		if (styleCode != other.styleCode)
			return false;
		return true;
	}
	@Override
	public String toString() {
		return String.format("Cart [cartCode=%s, member=%s, productCode=%s, styleCode=%s, size=%s, count=%s]", cartCode,
				member, productCode, styleCode, size, count);
	}
	
	
}
