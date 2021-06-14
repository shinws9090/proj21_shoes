package proj21_shoes.dto;

public class OrderOption { //상품주문정보(상세정보)
	
	private int productCode;		//상품코드
	private int styleCode;			//스타일코드
	private int size;				//사이즈
	private int stock;				//재고
	private String color;			//색상
	
	
	public OrderOption() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrderOption(int productCode, int styleCode, int size) {
		super();
		this.productCode = productCode;
		this.styleCode = styleCode;
		this.size = size;

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
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	@Override
	public String toString() {
		return String.format("OrderOption [productCode=%s, styleCode=%s, size=%s, stock=%s, color=%s]", productCode,
				styleCode, size, stock, color);
	}
	
	
}
