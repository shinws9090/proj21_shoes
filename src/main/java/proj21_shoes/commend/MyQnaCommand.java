package proj21_shoes.commend;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

public class MyQnaCommand { 				// 상품문의게시판

	private int boardCode; 		// 게시판코드
	private String memberCode; 		// 회원코드
	private String memberId; 		// 회원아이디
	private int productCode; 	// 상품코드
	private String productName; 	// 상품명
	private String productMainImage; //상품대표이미지
	private String title; 		// 제목
	private String content; 	// 내용
	private String reply;		 // 답글
	@DateTimeFormat(pattern = "yyyyMMdd")	
	private LocalDate registDate; // 등록일
	private String resOX;//답변유무
	
	//private int board_num;
	


	public MyQnaCommand() {
		// TODO Auto-generated constructor stub
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

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getProductCode() {
		return productCode;
	}

	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductMainImage() {
		return productMainImage;
	}

	public void setProductMainImage(String productMainImage) {
		this.productMainImage = productMainImage;
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

	public LocalDate getRegistDate() {
		return registDate;
	}

	public void setRegistDate(LocalDate registDate) {
		this.registDate = registDate;
	}
	
	
	
	

	public String getResOX() {
		if(reply!=null) {		
			
			return "답변완료";
			}else {
			return "답변준비중";
			}
	}

	public MyQnaCommand(int boardCode, String memberCode, String memberId, int productCode, String productName,
			String productMainImage, String title, String content, String reply, LocalDate registDate, String resOX) {
		super();
		this.boardCode = boardCode;
		this.memberCode = memberCode;
		this.memberId = memberId;
		this.productCode = productCode;
		this.productName = productName;
		this.productMainImage = productMainImage;
		this.title = title;
		this.content = content;
		this.reply = reply;
		this.registDate = registDate;
		this.resOX = resOX;
	}

	@Override
	public String toString() {
		return String.format(
				"MyQnaCommand [boardCode=%s, memberCode=%s, memberId=%s, productCode=%s, productName=%s, productMainImage=%s, title=%s, content=%s, reply=%s, registDate=%s, resOX=%s]",
				boardCode, memberCode, memberId, productCode, productName, productMainImage, title, content, reply,
				registDate, resOX);
	}

	

	
	




	





	

	

}
