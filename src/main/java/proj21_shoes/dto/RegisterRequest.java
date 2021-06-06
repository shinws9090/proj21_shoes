package proj21_shoes.dto;

import java.time.LocalDateTime;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

public class RegisterRequest {  	//회원정보 입력란 컨펌
	@NotBlank
	private String memberId; 		// 	회원아이디(회원코드랑은 다름)
	@Size(min=6)
	private String memberPwd;		// 	회원비밀번호
	@NotEmpty
	private String confirmPassword;	//	 비밀번호 확인
	@NotEmpty
	private String memberName;		//	 회원이름
	private boolean gender; 			// 	성별
	@DateTimeFormat(pattern = "yyyyMMdd")//HH 붙이면 시간도!
	private LocalDateTime birthday;			//	 생년월일
	private String email;				//	이메일
	private String tel; 				// 	연락처
	private String zipCode; 			// 	우편번호
	private String address; 			// 	주소
	private String detailAddress;		// 	상세주소
	
	
	
	
	
	public RegisterRequest(@NotBlank String memberId, @Size(min = 6) String memberPwd, @NotEmpty String memberName,
			boolean gender, LocalDateTime birthday, String email, String tel, String zipCode, String address,
			String detailAddress) {
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
	public RegisterRequest(@NotBlank String memberId, @Size(min = 6) String memberPwd, @NotEmpty String confirmPassword,
			@NotEmpty String memberName, boolean gender, LocalDateTime birthday, String email, String tel,
			String zipCode, String address, String detailAddress) {
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
	public RegisterRequest() {
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
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
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
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	
	
	
	public RegisterRequest(@NotBlank String memberId) {
		super();
		this.memberId = memberId;
	}
	
	

	@Override
	public String toString() {
		return String.format(
				"RegisterRequest [memberId=%s, memberPwd=%s, confirmPassword=%s, memberName=%s, gender=%s, birthday=%s, email=%s, tel=%s, zipCode=%s, address=%s, detailAddress=%s]",
				memberId, memberPwd, confirmPassword, memberName, gender, birthday, email, tel, zipCode, address,
				detailAddress);
	}
	public boolean isPasswordEqualToConfirmPassword() {  //비밀번호 확인
		return memberPwd.equals(confirmPassword);
	}
	
	

	
	
	
	

}
