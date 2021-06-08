package proj21_shoes.dto;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

public class MemberDetail {			//	회원상세정보
	
	private String memberId; 		// 	회원아이디(회원코드랑은 다름)
	private String memberPwd; 		// 	회원비밀번호
	private String memberName; 		//	 회원이름
	private boolean gender; 		// 	성별
	@DateTimeFormat(pattern = "yyyy-MM-dd")	
	private LocalDate birthday; 			//	 생년월일
	private String email; 			// 	이메일
	private String tel; 			// 	연락처
	private String zipCode; 		// 	우편번호
	private String address; 		// 	주소
	private String detailAddress;	// 	상세주소
	



	public MemberDetail() {
		// TODO Auto-generated constructor stub
	}



	public MemberDetail(String memberId) {
		super();
		this.memberId = memberId;
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



	public String getMemberName() {
		return memberName;
	}



	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}



	public boolean isGender() {
		return gender;
	}



	public void setGender(boolean gender) {
		this.gender = gender;
	}



	





	public LocalDate getBirthday() {
		return birthday;
	}



	public void setBirthday(LocalDate birthday) {
		this.birthday = birthday;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getTel() {
		return tel;
	}



	public void setTel(String tel) {
		this.tel = tel;
	}



	public String getZipCode() {
		return zipCode;
	}



	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public String getDetailAddress() {
		return detailAddress;
	}



	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}







	



	public MemberDetail(String memberId, String memberPwd, String memberName, boolean gender, LocalDate birthday,
			String email, String tel, String zipCode, String address, String detailAddress) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.gender = gender;
		this.birthday = birthday;
		this.email = email;
		this.tel = tel;
		this.zipCode = zipCode;
		this.address = address;
		this.detailAddress = detailAddress;
	}



	public MemberDetail(String memberId, String memberPwd, String memberName, boolean gender, String email, String tel,
			String zipCode, String address, String detailAddress) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.gender = gender;
		this.email = email;
		this.tel = tel;
		this.zipCode = zipCode;
		this.address = address;
		this.detailAddress = detailAddress;
	}



	public MemberDetail(String memberId, String memberPwd, String memberName, boolean gender) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.gender = gender;
	}



	







	//	////////////////입력받은 값이 회원가입시 저장된 패스워드와 일치하는지 확인
	public boolean matchPassword(String password) {
		return this.memberPwd.equals(password);
	}

	@Override
	public String toString() {
		return String.format(
				"MemberDetail [memberId=%s, memberPwd=%s, memberName=%s, gender=%s, birthday=%s, email=%s, tel=%s, zipCode=%s, address=%s, detailAddress=%s]",
				memberId, memberPwd, memberName, gender, birthday, email, tel, zipCode, address, detailAddress);
	}

}
