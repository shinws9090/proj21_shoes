package proj21_shoes.commend;

import java.time.LocalDate;
import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.NumberFormat;

import proj21_shoes.dto.Grade;
import proj21_shoes.dto.MemberDetail;

public class MyPageSelectCommend {
	//member_id, member_pwd, member_name, gender, birthday, email, tel, zipCode, address,
	//detail_address, `point`, cumulative_buy_amount, grade, quit_state, signUp_date
	
	private String memberId; 		// 	회원아이디(회원코드랑은 다름)
	private String memberPwd; 		// 	회원비밀번호
	private String memberName; 		//	 회원이름
	private String gender; 		// 	성별
	@DateTimeFormat(pattern = "yyyy-MM-dd")	
	private LocalDate birthday; 			//	 생년월일
	private String email; 			// 	이메일
	private String tel; 			// 	연락처
	private String zipCode; 		// 	우편번호
	private String address; 		// 	주소
	private String detailAddress;	// 	상세주소
	private int point; 					//	 포인트
	private int cumulativeBuyAmount;	// 	누적구매금액
	private String grade;				// 	등급

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDateTime signUpDate;	//	 가입일

	public MyPageSelectCommend() {
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
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


	public String getPoint() {
		String point2 = java.text.NumberFormat.getInstance().format(point);
		return point2;
	}
	

	public int getPointInt() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getCumulativeBuyAmount() {
		return cumulativeBuyAmount;
	}

	public void setCumulativeBuyAmount(int cumulativeBuyAmount) {
		this.cumulativeBuyAmount = cumulativeBuyAmount;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public LocalDateTime getSignUpDate() {
		return signUpDate;
	}

	public void setSignUpDate(LocalDateTime signUpDate) {
		this.signUpDate = signUpDate;
	}

	public MyPageSelectCommend(String memberId) {
		super();
		this.memberId = memberId;
	}
	
	

	public MyPageSelectCommend(String memberId, String memberPwd, String memberName, String gender, LocalDate birthday,
			String email, String tel, String zipCode, String address, String detailAddress, int point,
			int cumulativeBuyAmount, String grade, LocalDateTime signUpDate) {
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
		this.point = point;
		this.cumulativeBuyAmount = cumulativeBuyAmount;
		this.grade = grade;
		this.signUpDate = signUpDate;
	}

	@Override
	public String toString() {
		return String.format(
				"MyPageSelectCommend [memberId=%s, memberPwd=%s, memberName=%s, gender=%s, birthday=%s, email=%s, tel=%s, zipCode=%s, address=%s, detailAddress=%s, point=%s, cumulativeBuyAmount=%s, grade=%s, signUpDate=%s]",
				memberId, memberPwd, memberName, gender, birthday, email, tel, zipCode, address, detailAddress, point,
				cumulativeBuyAmount, grade, signUpDate);
	}
	
	

}
