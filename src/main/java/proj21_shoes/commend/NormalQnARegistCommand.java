package proj21_shoes.commend;

import java.time.LocalDateTime;

import javax.validation.constraints.NotEmpty;

import org.springframework.format.annotation.DateTimeFormat;

public class NormalQnARegistCommand { 				// 상품문의게시판

	private int boardCode; 		// 게시판코드
	private int memberCode; 		// 회원코드
	private int productCode; 	// 상품코드
	@NotEmpty(message="문의제목을 작성해주세요")
	private String title; 		// 제목
	@NotEmpty(message="문의내용을 작성해주세요")
	private String content; 	// 내용
	private String memberId; //회원아이디
	private String memberName; //회원이름
	
	@DateTimeFormat(pattern = "yyyyMMdd")	
	private LocalDateTime registDate; // 등록일

	
	
	
	
	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public int getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}

	

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}

	public int getProductCode() {
		return productCode;
	}

	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}



	public LocalDateTime getRegistDate() {
		return registDate;
	}

	public void setRegistDate(LocalDateTime registDate) {
		this.registDate = registDate;
	}





	
	
	public NormalQnARegistCommand() {
		// TODO Auto-generated constructor stub
	}

	public NormalQnARegistCommand(int memberCode, @NotEmpty(message = "문의제목을 작성해주세요") String title,
			@NotEmpty(message = "문의내용을 작성해주세요") String content) {
		super();
		this.memberCode = memberCode;
		this.title = title;
		this.content = content;
		
	}

	public NormalQnARegistCommand(int memberCode, @NotEmpty(message = "문의제목을 작성해주세요") String title,
			@NotEmpty(message = "문의내용을 작성해주세요") String content, String memberId, String memberName) {
		super();
		this.memberCode = memberCode;
		this.title = title;
		this.content = content;
	
		this.memberId = memberId;
		this.memberName = memberName;
	}

	@Override
	public String toString() {
		return String.format(
				"NormalQnARegistCommand [boardCode=%s, memberCode=%s, productCode=%s, title=%s, content=%s,  memberId=%s, memberName=%s, registDate=%s]",
				boardCode, memberCode, productCode, title, content,  memberId, memberName, registDate);
	}






}
