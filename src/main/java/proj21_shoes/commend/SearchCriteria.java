package proj21_shoes.commend;

public class SearchCriteria extends PageCriteria {
	private String searchType = ""; // 검색 타입(카테고리)
	private String keyword = ""; // 검색 키워드

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "SearchCriteria [searchType=" + searchType + ", keyword=" + keyword + "]";
	}
}
