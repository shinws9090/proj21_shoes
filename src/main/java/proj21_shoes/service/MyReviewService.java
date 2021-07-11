package proj21_shoes.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import proj21_shoes.commend.MyReviewCommend;
import proj21_shoes.commend.Pagination;
import proj21_shoes.commend.SearchCriteria;
import proj21_shoes.dto.ReView;

@Service
public interface MyReviewService {
	public List<ReView> selectReviewbyAllList();

	MyReviewCommend selectMyReviewByBoardCode(int boardCode);

	// 페이징 ( 상품문의만
	List<Map<String, Object>> SelectMyReviewList(String memberId, Pagination pagination) throws Exception;

	int MyReviewCount(String memberId) throws Exception;

	// 주문코드로 후기검색(후기확인용)
	MyReviewCommend selectMyReviewByOrderCode(int orderCode);

	// 페이징(미작성한 후기내역만)
	List<Map<String, Object>> SelectReviewPlzList(String memberId, Pagination pagination) throws Exception;

	int MyReviewPlzListCount(String memberId) throws Exception;;

	// 리스트 + 검색 + 페이징
	public List<MyReviewCommend> findAll(SearchCriteria scri) throws Exception;

	// 리스트 + 검색 + 페이징 (게시물 총 개수 구하기)
	public int countInfoList(SearchCriteria scri) throws Exception;
	
	public MyReviewCommend detailView(int boardCode) throws Exception;
	
	public int deleteReview(int boardCode);


}
