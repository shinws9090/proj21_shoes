package proj21_shoes.dto;

public class ReviewImage { 			// 	후기이미지
	
	private int imageCode; 			//	 이미지코드
	private int boardCode; 		// 	게시판코드
	private String image; 			// 	이미지

	public int getImageCode() {
		return imageCode;
	}

	public void setImageCode(int imageCode) {
		this.imageCode = imageCode;
	}

	public int getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return String.format("ReviewImage [imageCode=%s, boardCode=%s, image=%s]", imageCode, boardCode, image);
	}

}
