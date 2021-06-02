package proj21_shoes.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

public class RegisterRequest {  	//회원정보 입력란 컨펌
	@NotBlank
	private MemberDetail memberId; 		// 	회원아이디(회원코드랑은 다름)
	@Size(min=6)
	private MemberDetail memberPwd;		// 	회원비밀번호
	@NotEmpty
	private MemberDetail confirmPassword;	//	 비밀번호 확인
	@NotEmpty
	private MemberDetail memberName;		//	 회원이름
	@NotEmpty
	private MemberDetail gender; 			// 	성별
	@NotEmpty
	private MemberDetail birthday;			//	 생년월일
	@NotBlank
	@Email
	private MemberDetail email;				//	이메일
	@NotEmpty
	private MemberDetail tel; 				// 	연락처
	@NotEmpty
	private MemberDetail zipCode; 			// 	우편번호
	@NotEmpty
	private MemberDetail address; 			// 	주소
	@NotEmpty
	private MemberDetail detailAddress;		// 	상세주소
	

	
	public MemberDetail getMemberId() {
		return memberId;
	}




	public void setMemberId(MemberDetail memberId) {
		this.memberId = memberId;
	}




	public MemberDetail getMemberPwd() {
		return memberPwd;
	}




	public void setMemberPwd(MemberDetail memberPwd) {
		this.memberPwd = memberPwd;
	}




	public MemberDetail getConfirmPassword() {
		return confirmPassword;
	}




	public void setConfirmPassword(MemberDetail confirmPassword) {
		this.confirmPassword = confirmPassword;
	}




	public MemberDetail getMemberName() {
		return memberName;
	}




	public void setMemberName(MemberDetail memberName) {
		this.memberName = memberName;
	}




	public MemberDetail getGender() {
		return gender;
	}




	public void setGender(MemberDetail gender) {
		this.gender = gender;
	}




	public MemberDetail getBirthday() {
		return birthday;
	}




	public void setBirthday(MemberDetail birthday) {
		this.birthday = birthday;
	}




	public MemberDetail getTel() {
		return tel;
	}




	public void setTel(MemberDetail tel) {
		this.tel = tel;
	}




	public MemberDetail getZipCode() {
		return zipCode;
	}




	public void setZipCode(MemberDetail zipCode) {
		this.zipCode = zipCode;
	}




	public MemberDetail getAddress() {
		return address;
	}




	public void setAddress(MemberDetail address) {
		this.address = address;
	}




	public MemberDetail getDetailAddress() {
		return detailAddress;
	}




	public void setDetailAddress(MemberDetail detailAddress) {
		this.detailAddress = detailAddress;
	}




	public MemberDetail getEmail() {
		return email;
	}




	public void setEmail(MemberDetail email) {
		this.email = email;
	}




	public boolean isPasswordEqualToConfirmPassword() {  //비밀번호 확인
		return memberPwd.equals(confirmPassword);
	}



	
	public RegisterRequest(@NotBlank MemberDetail memberId, @Size(min = 6) MemberDetail memberPwd,
			@NotEmpty MemberDetail confirmPassword, @NotEmpty MemberDetail memberName, @NotEmpty MemberDetail gender,
			@NotEmpty MemberDetail birthday, @NotBlank @Email MemberDetail email, @NotEmpty MemberDetail tel,
			@NotEmpty MemberDetail zipCode, @NotEmpty MemberDetail address, @NotEmpty MemberDetail detailAddress) {
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




	@Override
	public String toString() {
		return String.format(
				"RegisterRequest [memberId=%s, memberPwd=%s, confirmPassword=%s, memberName=%s, gender=%s, birthday=%s, tel=%s, zipCode=%s, address=%s, detailAddress=%s, email=%s]",
				memberId, memberPwd, confirmPassword, memberName, gender, birthday, tel, zipCode, address,
				detailAddress, email);
	}

	
	
	

}
