package proj21_shoes.dto;

import java.time.LocalDateTime;

public class ReView {					// 상품후기게시판

	private int boardCode; 				// 	게시판코드
	private Order orderCode; 			// 	주문코드
	private String title;				// 	제목
	private String content;				// 	내용
	private LocalDateTime regist_date;	// 	등록일
	public int getBoardCode() {
		return boardCode;
	}
	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}
	public Order getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(Order orderCode) {
		this.orderCode = orderCode;
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
	public LocalDateTime getRegist_date() {
		return regist_date;
	}
	public void setRegist_date(LocalDateTime regist_date) {
		this.regist_date = regist_date;
	}
	
	@Override
	public String toString() {
		return String.format("ReView [boardCode=%s, orderCode=%s, title=%s, content=%s, regist_date=%s]", boardCode,
				orderCode, title, content, regist_date);
	}
	
	

}
