package proj21_shoes.dto;

import java.time.LocalDateTime;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

public class MemberDetail {			//	회원상세정보
	@NotBlank
	private String memberId; 		// 	회원아이디(회원코드랑은 다름)
	@Size(min=6)
	private String memberPwd; 		// 	회원비밀번호
	@NotEmpty
	private MemberDetail confirmPassword;	//	 비밀번호 확인
	@NotEmpty
	private String memberName; 		//	 회원이름
	@NotEmpty
	private boolean gender; 		// 	성별
	@NotEmpty
	private LocalDateTime birthday; //	 생년월일
	@NotBlank
	@Email
	private String email; 			// 	이메일
	@NotEmpty
	private String tel; 			// 	연락처
	
	private String zipCode; 		// 	우편번호
	@NotEmpty
	private String address; 		// 	주소
	@NotEmpty
	private String detailAddress;	// 	상세주소



	public MemberDetail() {
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



	public LocalDateTime getBirthday() {
		return birthday;
	}



	public void setBirthday(LocalDateTime birthday) {
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



	public void setDetailAddress(String detailAddress) {//비밀번호 확인
		this.detailAddress = detailAddress;
	}



	public MemberDetail getConfirmPassword() {
		return confirmPassword;
	}



	public void setConfirmPassword(MemberDetail confirmPassword) {
		this.confirmPassword = confirmPassword;
	}



	public MemberDetail(@NotBlank String memberId, @Size(min = 6) String memberPwd,
			@NotEmpty MemberDetail confirmPassword, @NotEmpty String memberName, @NotEmpty boolean gender,
			@NotEmpty LocalDateTime birthday, @NotBlank @Email String email, @NotEmpty String tel, String zipCode,
			@NotEmpty String address, @NotEmpty String detailAddress) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.confirmPassword = confirmPassword;
		this.memberName = memberName;
		this.gender = gender;
		this.birthday = birthday;
		this.email = email;
		this.tel = tel;
		this.zipCode = zipCode;
		this.address = address;
		this.detailAddress = detailAddress;
	}



	public MemberDetail(String memberId, String memberPwd, String memberName, boolean gender, LocalDateTime birthday,
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



	




	public boolean isPasswordEqualToConfirmPassword() {  //비밀번호 확인
		return memberPwd.equals(confirmPassword);
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
