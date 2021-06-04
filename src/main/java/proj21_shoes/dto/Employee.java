package proj21_shoes.dto;

public class Employee { // 직원정보
	private int empNumber; // 사원번보
	private String empName; // 사원명
	private Authority authority; // 권한
	private String empId; // 직원아이디
	private String empPwd; // 직원비번
	private String email; // 이메일
	private String telNumber; // 전화번호

	public Employee() {
		// TODO Auto-generated constructor stub
	}

	public Employee(int empNumber) {
		this.empNumber = empNumber;
	}

	public int getEmpNumber() {
		return empNumber;
	}

	public void setEmpNumber(int empNumber) {
		this.empNumber = empNumber;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public Authority getAuthority() {
		return authority;
	}

	public void setAuthority(Authority authority) {
		this.authority = authority;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getEmpPwd() {
		return empPwd;
	}

	public void setEmpPwd(String empPwd) {
		this.empPwd = empPwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelNumber() {
		return telNumber;
	}

	public void setTelNumber(String telNumber) {
		this.telNumber = telNumber;
	}

	@Override
	public String toString() {
		return String.format(
				"Employee [empNumber=%s, empName=%s, authority=%s, empId=%s, empPwd=%s, email=%s, telNumber=%s]",
				empNumber, empName, authority, empId, empPwd, email, telNumber);
	}

}
