package proj21_shoes.commend;

public class MyPriceCommend {


	int selPrice;
	int orderCount;
	double gradeHal;
	double lastPrice;
	double point;

	public String getSelPrice() {
		String selPrice2 =java.text.NumberFormat.getInstance().format(selPrice);
		return selPrice2;
	}
	public void setSelPrice(int selPrice) {
		this.selPrice = selPrice;
	}
	public String getOrderCount() {
		String orderCount2 =java.text.NumberFormat.getInstance().format(orderCount);
		return orderCount2;
	}
	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}
	public String getGradeHal() {
		String gradeHal2 =java.text.NumberFormat.getInstance().format(gradeHal);
		return gradeHal2;
	}
	public void setGardeHal(double gardeHal) {
		this.gradeHal = gardeHal;
	}
	public String getLastPrice() {
		String lastPrice2 =java.text.NumberFormat.getInstance().format(lastPrice);
		return lastPrice2;
	}
	public void setLastPrice(double lastPrice) {
		this.lastPrice = lastPrice;
	}
	public String getPoint() {
		String point2 =java.text.NumberFormat.getInstance().format(point);
		return point2;
	}
	public void setPoint(double point) {
		this.point = point;
	}
	
	
	public MyPriceCommend() {
		// TODO Auto-generated constructor stub
	}
	public MyPriceCommend(int selPrice, int orderCount, double gardeHal, double lastPrice, double point) {
		super();
		this.selPrice = selPrice;
		this.orderCount = orderCount;
		this.gradeHal = gardeHal;
		this.lastPrice = lastPrice;
		this.point = point;
	}
	@Override
	public String toString() {
		return String.format("MyPriceCommend [selPrice=%s, orderCount=%s, gardeHal=%s, lastPrice=%s, point=%s]",
				selPrice, orderCount, gradeHal, lastPrice, point);
	}


	
	

}
