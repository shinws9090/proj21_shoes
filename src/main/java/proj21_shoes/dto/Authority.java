package proj21_shoes.dto;

public class Authority {//권한구분
	private int authorityCode; //권한코드
	private String authority; //권한내용
	
	
	
	public int getAuthorityCode() {
		return authorityCode;
	}
	public void setAuthorityCode(int authorityCode) {
		this.authorityCode = authorityCode;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
	@Override
	public String toString() {
		return String.format("Authority [authorityCode=%s, authority=%s]", authorityCode, authority);
	}
	
	
}
