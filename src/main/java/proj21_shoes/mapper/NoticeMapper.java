package proj21_shoes.mapper;

import java.util.List;

import proj21_shoes.commend.SearchCriteria;
import proj21_shoes.dto.Notice;

public interface NoticeMapper {
	public List<Notice> selectNoticebyAllList();
	
	// 리스트 + 검색 + 페이징
	public List<Notice> findAll(SearchCriteria scri) throws Exception;

	// 리스트 + 검색 + 페이징 (게시물 총 개수 구하기)
	public int countInfoList(SearchCriteria scri) throws Exception;
	
	public Notice detailView(int boardCode) throws Exception;
}
