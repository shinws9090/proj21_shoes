package proj21_shoes.dto;

import java.time.LocalDateTime;

public class Qna { // 상품문의게시판

	private int boardCode; // 게시판코드
	private Member member; // 회원코드
	private int productCode; // 상품코드
	private String title; // 제목
	private String content; // 내용
	private String reply; // 답글
	private LocalDateTime registDate; // 등록일

	public int getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
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

	@Override
	public String toString() {
		return String.format(
				"Qna [boardCode=%s, member=%s, productCode=%s, title=%s, content=%s, reply=%s, registDate=%s]",
				boardCode, member, productCode, title, content, reply, registDate);
	}

}
