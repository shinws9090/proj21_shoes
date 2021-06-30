package proj21_shoes.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import proj21_shoes.commend.ModifyMyNormalQnACommend;
import proj21_shoes.commend.MyQnaViewCommand;
import proj21_shoes.commend.NormalQnARegistCommand;
import proj21_shoes.commend.Pagination;
import proj21_shoes.commend.SearchCriteria;
@Service
public interface MyQnaService {
	
	public List<MyQnaViewCommand> selectQnAbyAll();
	
	MyQnaViewCommand selectProductQnAbyBoardCode(int boardCode);				
	MyQnaViewCommand selectNormalQnAbyBoardCode(int boardCode);				

	//페이징 ( 상품문의만 
	List<Map<String, Object>> SelectMyPdQnAList (String memberId, Pagination pagination) throws Exception;
	
	int MyPdQnACount(String memberId) throws Exception;
	//페이징( 일반문의만
	List<Map<String, Object>> SelectMyNmQnAList (String memberId, Pagination pagination) throws Exception;
		
	int MyNmQnACount(String memberId) throws Exception;
	   
	   
	//일반문의하기
	int insertNormalQnA(NormalQnARegistCommand qna); 		 
	
	int updateNormalQnA(ModifyMyNormalQnACommend updateQnA);
	
	
	// 리스트 + 검색 + 페이징
	public List<MyQnaViewCommand> findAll(SearchCriteria scri) throws Exception;

	// 리스트 + 검색 + 페이징 (게시물 총 개수 구하기)
	public int countInfoList(SearchCriteria scri) throws Exception;
	
}
