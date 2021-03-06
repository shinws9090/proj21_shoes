package proj21_shoes.dto;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

public class Member {					//	회원정보
	
	private int memberCode;				// 	회원코드
	private MemberDetail memberId;		// 	회원아이디
	private int point; 					//	 포인트
	private int cumulativeBuyAmount;	// 	누적구매금액
	private Grade gradeCode;			// 	등급코드
	private boolean quitState;			// 	탈퇴여부
	@DateTimeFormat(pattern = "yyyy-MM-dd")	
	private LocalDateTime signUpDate;	//	 가입일

	
	
	
	
	
	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}

	public MemberDetail getMemberId() {
		return memberId;
	}

	public void setMemberId(MemberDetail memberId) {
		this.memberId = memberId;
	}

	public int getPoint() {
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

	public Grade getGradeCode() {
		return gradeCode;
	}

	public void setGradeCode(Grade gradeCode) {
		this.gradeCode = gradeCode;
	}

	public boolean isQuitState() {
		return quitState;
	}

	public void setQuitState(boolean quitState) {
		this.quitState = quitState;
	}

	public LocalDateTime getSignUpDate() {
		return signUpDate;
	}

	public void setSignUpDate(LocalDateTime signUpDate) {
		this.signUpDate = signUpDate;
	}

	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(int memberCode) {
		this.memberCode = memberCode;
	}

	public Member(Grade gradeCode) {
		super();
		this.gradeCode = gradeCode;
	}

	public Member(MemberDetail memberId) {
		super();
		this.memberId = memberId;
	}

	public Member(MemberDetail memberId, int point, int cumulativeBuyAmount, Grade gradeCode, boolean quitState,
			LocalDateTime signUpDate) {
		super();
		this.memberId = memberId;
		this.point = point;
		this.cumulativeBuyAmount = cumulativeBuyAmount;
		this.gradeCode = gradeCode;
		this.quitState = quitState;
		this.signUpDate = signUpDate;
	}

	@Override
	public String toString() {
		return String.format(
				"Member [memberCode=%s, memberId=%s, point=%s, cumulativeBuyAmount=%s, gradeCode=%s, quitState=%s, signUpDate=%s]",
				memberCode, memberId, point, cumulativeBuyAmount, gradeCode, quitState, signUpDate);
	}


}
