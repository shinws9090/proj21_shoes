package proj21_shoes.commend;

import java.time.LocalDateTime;

import proj21_shoes.dto.Member;

public class MyQnaCommand { 				// 상품문의게시판

	private int boardCode; 		// 게시판코드
	private String memberCode; 		// 회원코드
	private int productCode; 	// 상품코드
	private String title; 		// 제목
	private String content; 	// 내용
	private String reply;		 // 답글
	private LocalDateTime registDate; // 등록일
	private String memberId;
	//private int board_num;
	
	
	
	public MyQnaCommand(int boardCode, String memberCode, int productCode, String title, String content, String reply,
			LocalDateTime registDate, String memberId) {
		super();
		this.boardCode = boardCode;
		this.memberCode = memberCode;
		this.productCode = productCode;
		this.title = title;
		this.content = content;
		this.reply = reply;
		this.registDate = registDate;
		this.memberId = memberId;
	}



	public MyQnaCommand() {
		// TODO Auto-generated constructor stub
	}



	public MyQnaCommand(String memberId) {
		super();
		this.memberId = memberId;
	}



	public int getBoardCode() {
		return boardCode;
	}



	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}



	public String getMemberCode() {
		return memberCode;
	}



	public void setMemberCode(String memberCode) {
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



	public LocalDateTime getRegistDate() {
		return registDate;
	}



	public void setRegistDate(LocalDateTime registDate) {
		this.registDate = registDate;
	}



	public String getMemberId() {
		return memberId;
	}



	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}



	public MyQnaCommand(int boardCode, String memberCode, int productCode, String title, String content, String reply,
			LocalDateTime registDate) {
		super();
		this.boardCode = boardCode;
		this.memberCode = memberCode;
		this.productCode = productCode;
		this.title = title;
		this.content = content;
		this.reply = reply;
		this.registDate = registDate;
	}



	@Override
	public String toString() {
		return String.format(
				"MyQnaCommand [boardCode=%s, memberCode=%s, productCode=%s, title=%s, content=%s, reply=%s, registDate=%s]",
				boardCode, memberCode, productCode, title, content, reply, registDate);
	}

	

	

}
