package proj21_shoes.dto;

import java.time.LocalDate;

public class Notice { // 공지사항

	private int boardCode; // 게시판코드
	private Employee employee; // 사원정보
	private String title; // 제목
	private String content; // 내용
	private LocalDate registDate; // 등록일
	private int nextCode;
	private int prevCode;

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

	public LocalDate getRegistDate() {
		return registDate;
	}

	public void setRegistDate(LocalDate registDate) {
		this.registDate = registDate;
	}

	public int getNextCode() {
		return nextCode;
	}

	public void setNextCode(int nextCode) {
		this.nextCode = nextCode;
	}

	public int getPrevCode() {
		return prevCode;
	}

	public void setPrevCode(int prevCode) {
		this.prevCode = prevCode;
	}

	@Override
	public String toString() {
		return String.format(
				"Notice [boardCode=%s, employee=%s, title=%s, content=%s, registDate=%s, nextCode=%s, prevCode=%s]",
				boardCode, employee, title, content, registDate, nextCode, prevCode);
	}

}
