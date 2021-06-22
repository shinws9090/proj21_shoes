package proj21_shoes.commend;

public class MyPageBoardCommand {
	
	private int page;   //페이지
	private int maxPage;//최대수
	private int startPage;//시작페이지
	private int endPage;//마지막페이지
	private int listCount;//게시글수
	
	public int getPage() {
		return page;
	}
	
	public MyPageBoardCommand(int page, int maxPage, int startPage, int endPage, int listCount) {
		super();
		this.page = page;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.listCount = listCount;
	}

	public void setPage(int page) {
		this.page = page;
	}
	
	public int getMaxPage() {
		return maxPage;
	}
	
	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}
	
	public int getStartPage() {
		return startPage;
	}
	
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	
	public int getEndPage() {
		return endPage;
	}
	
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	public int getListCount() {
		return listCount;
	}
	
	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	@Override
	public String toString() {
		return String.format("PageInfo [page=%s, maxPage=%s, startPage=%s, endPage=%s, listCount=%s]", page, maxPage,
				startPage, endPage, listCount);
	}

}
