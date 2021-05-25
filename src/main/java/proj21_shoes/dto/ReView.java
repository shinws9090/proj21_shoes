package proj21_shoes.dto;

import java.time.LocalDateTime;

public class ReView {// 상품후기게시판

	private int boardCode; 				// 	게시판코드
	private Order orderCode; 			// 	주문코드
	private String title;				// 	제목
	private String content;				// 	내용
	private LocalDateTime regist_date;	// 	등록일

}
