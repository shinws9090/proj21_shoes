package proj21_shoes.commend;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

public class ReviewCommand {
	
	private int boardCode; 		// 게시판코드
	private int orderCode;
	private String image;
	private String title; 		// 제목
	private String memberId; 		// 회원아이디
	private String content; 	// 내용
	@DateTimeFormat(pattern = "yyyyMMdd")	
	private LocalDate registDate; // 등록일
	
	public ReviewCommand() {
		// TODO Auto-generated constructor stub
	}

	public int getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}

	public int getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(int orderCode) {
		this.orderCode = orderCode;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public LocalDate getRegistDate() {
		return registDate;
	}

	public void setRegistDate(LocalDate registDate) {
		this.registDate = registDate;
	}

	public ReviewCommand(int boardCode, int orderCode, String image, String title, String memberId, String content,
			LocalDate registDate) {
		super();
		this.boardCode = boardCode;
		this.orderCode = orderCode;
		this.image = image;
		this.title = title;
		this.memberId = memberId;
		this.content = content;
		this.registDate = registDate;
	}

	@Override
	public String toString() {
		return String.format(
				"ReviewCommand [boardCode=%s, orderCode=%s, image=%s, title=%s, memberId=%s, content=%s, registDate=%s]",
				boardCode, orderCode, image, title, memberId, content, registDate);
	}
	
	
	
	
	
	
	
}
