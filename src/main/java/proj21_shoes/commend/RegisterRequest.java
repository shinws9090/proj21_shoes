package proj21_shoes.commend;

import java.time.LocalDate;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

public class RegisterRequest {  					//회원정보 입력란 컨펌
	@NotBlank(message="아이디를 입력해주세요!")
	private String memberId; 						// 	회원아이디(회원코드랑은 다름)
	
	@NotEmpty(message="비밀번호를 입력해주세요!")
	@Size(min=6,message="6자리수 이상 입력해주세요!")
	private String memberPwd;						// 	회원비밀번호
	
	@NotEmpty(message="비밀번호 확인을 입력해주세요!")
	private String confirmPassword;					//	 비밀번호 확인
	@NotEmpty(message="이름을 입력해주세요!")
	private String memberName;						//	 회원이름
	private boolean gender; 						// 	성별
	
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")			//HH 붙이면 시간도!
	@Past(message="과거시간만 입력할 수 있어요!!!")
	private LocalDate birthday;				//	 생년월일
	
	@NotEmpty(message="email을 입력해주세요!")
	@Email
	private String email;							//	이메일
	
	@NotEmpty(message="연락처를 입력해주세요!")
	private String tel; 							// 	연락처
	
	@NotEmpty(message="우편번호를 입력해주세요!")
	private String zipCode; 						// 	우편번호
	
	@NotEmpty(message="주소를 입력해주세요!")
	private String address; 						// 	주소
	@NotEmpty
	private String detailAddress;					// 	상세주소
	
	


	
	public RegisterRequest() {
		//birthday = LocalDate.now();
	//	gender = true;
	}
	
	
	
	public RegisterRequest(@NotBlank(message = "아이디를 입력해주세요!") String memberId,
			@NotEmpty(message = "비밀번호를 입력해주세요!") @Size(min = 6, message = "6자리수 이상 입력해주세요!") String memberPwd,
			@NotEmpty(message = "비밀번호 확인을 입력해주세요!") String confirmPassword,
			@NotEmpty(message = "이름을 입력해주세요!") String memberName, boolean gender,
			@Past(message = "과거시간만 입력할 수 있어요!!!") LocalDate birthday,
			@NotEmpty(message = "email을 입력해주세요!") @Email String email, @NotEmpty(message = "연락처를 입력해주세요!") String tel,
			@NotEmpty(message = "우편번호를 입력해주세요!") String zipCode, @NotEmpty(message = "주소를 입력해주세요!") String address,
			@NotEmpty String detailAddress) {
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


	/*
	 * public RegisterRequest() { birthday = LocalDateTime.parse("2021-05-05"); }
	 */
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
	
	
	
	public RegisterRequest(@NotBlank(message = "아이디를 입력해주세요!") String memberId,
			@NotEmpty(message = "비밀번호를 입력해주세요!") @Size(min = 6, message = "6자리수 이상 입력해주세요!") String memberPwd,
			@NotEmpty(message = "이름을 입력해주세요!") String memberName, boolean gender,
			@Past(message = "과거시간만 입력할 수 있어요!!!") LocalDate birthday,
			@NotEmpty(message = "email을 입력해주세요!") @Email String email, @NotEmpty(message = "연락처를 입력해주세요!") String tel,
			@NotEmpty(message = "우편번호를 입력해주세요!") String zipCode, @NotEmpty(message = "주소를 입력해주세요!") String address,
			@NotEmpty String detailAddress) {
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
