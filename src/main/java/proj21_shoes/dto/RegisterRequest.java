package proj21_shoes.dto;

import java.time.LocalDateTime;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import com.sun.javafx.beans.IDProperty;

public class RegisterRequest {  	//회원정보 입력란 컨펌
	@NotBlank
	private String memberId; 		// 	회원아이디(회원코드랑은 다름)
	@Size(min=6)
	private String memberPwd;		// 	회원비밀번호
	@NotEmpty
	private String confirmPassword;	//	 비밀번호 확인
	@NotEmpty
	private String memberName;		//	 회원이름
	@NotEmpty
	private boolean gender; 		// 	성별
	@NotEmpty
	private LocalDateTime birthday;	//	 생년월일
	@NotEmpty
	private String tel; 			// 	연락처
	@NotEmpty
	private String zipCode; 		// 	우편번호
	@NotEmpty
	private String address; 		// 	주소
	@NotEmpty
	private String detailAddress;	// 	상세주소
	@NotBlank
	@Email
	private String email;



	
	
	
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String conformPassword) {
		this.confirmPassword = conformPassword;
	}

	
	public boolean isPasswordEqualToConfirmPassword() {
		return memberPwd.contentEquals(confirmPassword);
	}



	
	public RegisterRequest(@NotBlank String memberId, @Size(min = 6) String memberPwd, @NotEmpty String confirmPassword,
			@NotEmpty String memberName, @NotEmpty boolean gender, @NotEmpty LocalDateTime birthday,
			@NotEmpty String tel, @NotEmpty String zipCode, @NotEmpty String address, @NotEmpty String detailAddress,
			@NotBlank @Email String email) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.confirmPassword = confirmPassword;
		this.memberName = memberName;
		this.gender = gender;
		this.birthday = birthday;
		this.tel = tel;
		this.zipCode = zipCode;
		this.address = address;
		this.detailAddress = detailAddress;
		this.email = email;
	}

	@Override
	public String toString() {
		return String.format(
				"RegisterRequest [memberId=%s, memberPwd=%s, confirmPassword=%s, memberName=%s, gender=%s, birthday=%s, tel=%s, zipCode=%s, address=%s, detailAddress=%s, email=%s]",
				memberId, memberPwd, confirmPassword, memberName, gender, birthday, tel, zipCode, address,
				detailAddress, email);
	}

	
	
	

}
