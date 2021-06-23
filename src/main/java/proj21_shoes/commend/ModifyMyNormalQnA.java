package proj21_shoes.commend;

import java.time.LocalDateTime;

import javax.validation.constraints.NotEmpty;

import org.springframework.format.annotation.DateTimeFormat;

public class ModifyMyNormalQnA { 				// 상품문의게시판

	private int boardCode; 		// 게시판코드
	private int memberCode; 		// 회원코드
	private int productCode; 	// 상품코드
	@NotEmpty(message="문의제목을 작성해주세요")
	private String title; 		// 제목
	@NotEmpty(message="문의내용을 작성해주세요")
	private String content; 	// 내용
	private String reply;		 // 답글
	private String memberId; //회원아이디
	private String memberName; //회원이름
	
	@DateTimeFormat(pattern = "yyyyMMdd")	
	private LocalDateTime registDate; // 등록일

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

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

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

	public LocalDateTime getRegistDate() {
		return registDate;
	}

	public void setRegistDate(LocalDateTime registDate) {
		this.registDate = registDate;
	}

	public ModifyMyNormalQnA(int boardCode, int memberCode, int productCode,
			@NotEmpty(message = "문의제목을 작성해주세요") String title, @NotEmpty(message = "문의내용을 작성해주세요") String content,
			String reply, String memberId, String memberName, LocalDateTime registDate) {
		super();
		this.boardCode = boardCode;
		this.memberCode = memberCode;
		this.productCode = productCode;
		this.title = title;
		this.content = content;
		this.reply = reply;
		this.memberId = memberId;
		this.memberName = memberName;
		this.registDate = registDate;
	}

	public ModifyMyNormalQnA(int boardCode, @NotEmpty(message = "문의제목을 작성해주세요") String title,
			@NotEmpty(message = "문의내용을 작성해주세요") String content) {
		super();
		this.boardCode = boardCode;
		this.title = title;
		this.content = content;
	}

	public ModifyMyNormalQnA(int boardCode) {
		super();
		this.boardCode = boardCode;
	}

	public ModifyMyNormalQnA(String memberId) {
		super();
		this.memberId = memberId;
	}

	public ModifyMyNormalQnA(int boardCode, String memberId) {
		super();
		this.boardCode = boardCode;
		this.memberId = memberId;
	}

	public ModifyMyNormalQnA() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return String.format(
				"ModifyMyNormalQnA [boardCode=%s, memberCode=%s, productCode=%s, title=%s, content=%s, reply=%s, memberId=%s, memberName=%s, registDate=%s]",
				boardCode, memberCode, productCode, title, content, reply, memberId, memberName, registDate);
	}

	




}
