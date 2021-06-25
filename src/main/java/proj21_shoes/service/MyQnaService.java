package proj21_shoes.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import proj21_shoes.commend.ModifyMyNormalQnACommend;
import proj21_shoes.commend.MyQnaViewCommand;
import proj21_shoes.commend.NormalQnARegistCommand;
import proj21_shoes.commend.Pagination;
@Service
public interface MyQnaService {
// 페이징 전에꺼라 안쓴다//////////////////////////////
	//상품문의내역만 검색
	List<MyQnaViewCommand> selectProductQnAbyId(String member);					//회원아이디로
	MyQnaViewCommand selectProductQnAbyBoardCode(int boardCode);					//게시판코드로
	//일반문의내역만 검색
	List<MyQnaViewCommand> selectNormalQnAbyId(String member);					//회원아이디로
	MyQnaViewCommand selectNormalQnAbyBoardCode(int boardCode);					//게시판코드로
	
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	//페이징 ( 상품문의만 
	 List<Map<String, Object>> SelectMyPdQnAList (String memberId, Pagination pagination) throws Exception;
	
	   int MyPdQnACount(String memberId) throws Exception;
	//페이징( 일반문의만
	   List<Map<String, Object>> SelectMyNmQnAList (String memberId, Pagination pagination) throws Exception;
		
	   int MyNmQnACount(String memberId) throws Exception;
	   
	   
	//일반문의하기
	int insertNormalQnA(NormalQnARegistCommand qna); 		 //일반문의하기
	
	int updateNormalQnA(ModifyMyNormalQnACommend updateQnA);  				//일반문의내용 수정

	
}
