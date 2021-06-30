package proj21_shoes.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import proj21_shoes.commend.MyReviewCommend;
import proj21_shoes.commend.SearchCriteria;
import proj21_shoes.dto.ReView;

@Component
public interface MyReviewMapper {
	public List<ReView> selectReviewbyAllList();

	MyReviewCommend selectMyReviewByBoardCode(int boardCode);

	// 페이징(작성한 후기내역만)
	List<Map<String, Object>> SelectMyReviewList(@Param("memberId") String memberId,
			@Param("pageSearch") int pageSearch, @Param("cntPerPage") int cntPerPage);

	int MyReviewCount(String memberId);

	// 주문코드로 후기검색(후기작성 확인용)
	MyReviewCommend selectMyReviewByOrderCode(int orderCode);

	// 페이징(미작성한 후기내역만)
	List<Map<String, Object>> SelectReviewPlzList(@Param("memberId") String memberId,
			@Param("pageSearch") int pageSearch, @Param("cntPerPage") int cntPerPage);

	int MyReviewPlzListCount(String memberId);

	// 리스트 + 검색 + 페이징
	public List<MyReviewCommend> findAll(SearchCriteria scri) throws Exception;

	// 리스트 + 검색 + 페이징 (게시물 총 개수 구하기)
	public int countInfoList(SearchCriteria scri) throws Exception;

}
