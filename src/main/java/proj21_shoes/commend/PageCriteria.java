package proj21_shoes.commend;

public class PageCriteria {

	private int page; // 현재페이지번호
	private int perPageNum; // 페이지당 보여줄 게시글의 개수

	// sql문에서 pageStart에 들어갈 값.
	// 게시글 몇번째 부터 시작할 지 결정
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}

	public PageCriteria() { // 초기값 셋팅
		this.page = 1;
		this.perPageNum = 10;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
		} else {
			this.page = page;
		}
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int pageCount) {
		int cnt = this.perPageNum;
		if (pageCount != cnt) {
			this.perPageNum = cnt;
		} else {
			this.perPageNum = pageCount;
		}
	}

}
