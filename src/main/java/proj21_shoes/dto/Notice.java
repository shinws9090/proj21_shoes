package proj21_shoes.dto;

import java.time.LocalDateTime;

public class Notice { //공지사항
	
	private int boardCode; //게시판코드
	private Employee employee; //사원정보
	private String title; //제목
	private String content; //내용
	private LocalDateTime registDate; //등록일
	public int getBoardCode() {
		return boardCode;
	}
	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
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
	
	@Override
	public String toString() {
		return String.format("Notice [boardCode=%s, employee=%s, title=%s, content=%s, registDate=%s]", boardCode,
				employee, title, content.length(), registDate);
	}
	
	
}
