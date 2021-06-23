package proj21_shoes.exeption;

@SuppressWarnings("serial")
public class MemberNotFoundException extends RuntimeException {

	public MemberNotFoundException(String arg0) {
		super(arg0);
		// TODO Auto-generated constructor stub
	}

	public MemberNotFoundException() {
		System.out.println("이거뭐지");
	}
	

}