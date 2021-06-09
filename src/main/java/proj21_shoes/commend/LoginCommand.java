package proj21_shoes.commend;

public class LoginCommand { //로그인 폼에 입력한 값을 전달받기 위한 dto member와 같은 테이블 사용하지만 용도에 따라 새로만든거당
	private String memberId;
	private String memberPwd;
	private boolean rememberId;

	

	public LoginCommand() {
		// TODO Auto-generated constructor stub
	}



	public String getMemberId() {
		return memberId;
	}



	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}



	public String getMemberPwd() {
		return memberPwd;
	}



	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}



	public boolean isRememberId() {
		return rememberId;
	}



	public void setRememberId(boolean rememberId) {
		this.rememberId = rememberId;
	}



	public LoginCommand(String memberId, String memberPwd, boolean rememberId) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.rememberId = rememberId;
	}



	@Override
	public String toString() {
		return String.format("LoginCommand [memberId=%s, memberPwd=%s, rememberId=%s]", memberId, memberPwd,
				rememberId);
	}



	
}
