package proj21_shoes.commend;

public class AuthInfo {

	private String memberId;
	private String email;
	private String memberName;
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	
	
	public AuthInfo(String memberId, String email, String memberName) {
		super();
		this.memberId = memberId;
		this.email = email;
		this.memberName = memberName;
	}
	@Override
	public String toString() {
		return String.format("AuthInfo [memberId=%s, email=%s, memberName=%s]", memberId, email, memberName);
	}



	
	
}
