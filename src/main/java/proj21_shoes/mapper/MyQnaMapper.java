package proj21_shoes.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import proj21_shoes.commend.ModifyMyNormalQnACommend;
import proj21_shoes.commend.MyQnaViewCommand;
import proj21_shoes.commend.NormalQnARegistCommand;
import proj21_shoes.commend.SearchCriteria;
import proj21_shoes.dto.Qna;

@Component
public interface MyQnaMapper {
					
	public List<MyQnaViewCommand> selectQnAbyAllList();
	
	MyQnaViewCommand selectProductQnAbyBoardCode(int boardCode);				
	MyQnaViewCommand selectNormalQnAbyBoardCode(int boardCode);					
	
	//페이징(상품문의내역만)
	List<Map<String, Object>> SelectMyPdQnAList (@Param("memberId") String memberId, @Param("pageSearch") int pageSearch, @Param("cntPerPage") int cntPerPage);
	int MyPdQnACount(String memberId);
	 
	//페이징(일반문의내역만)
	List<Map<String, Object>> SelectMyNmQnAList (@Param("memberId") String memberId, @Param("pageSearch") int pageSearch, @Param("cntPerPage") int cntPerPage);	
	int MyNmQnACount(String memberId);
	
	//일반문의글작성
	int insertNormalQnA(NormalQnARegistCommand qna);
	int updateNormalQnA(ModifyMyNormalQnACommend qna);
	
	// 리스트 + 검색 + 페이징
	public List<MyQnaViewCommand> findAll(SearchCriteria scri) throws Exception;

	// 리스트 + 검색 + 페이징 (게시물 총 개수 구하기)
	public int countInfoList(SearchCriteria scri) throws Exception;
	
	public MyQnaViewCommand detailView(int boardCode) throws Exception;
	
	public int updateQna(Qna qna);
	
	public int deleteQna(int boardCode);
	
	
	
	

}
