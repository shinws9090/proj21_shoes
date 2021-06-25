package proj21_shoes.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import proj21_shoes.commend.ModifyMyNormalQnACommend;
import proj21_shoes.commend.MyQnaViewCommand;
import proj21_shoes.commend.NormalQnARegistCommand;

@Component
public interface MyQnaMapper {
										
//	List<MyQnaCommand> selectMyQnaAll();	
									
	
	//페이징이전이라 안쓴다	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	//상품문의내역만 검색
	List<MyQnaViewCommand> selectProductQnAbyId(String member);					//회원아이디로
	MyQnaViewCommand selectProductQnAbyBoardCode(int boardCode);					//게시판코드로
	//일반문의내역만 검색
	List<MyQnaViewCommand> selectNormalQnAbyId(String member);					//회원아이디로
	MyQnaViewCommand selectNormalQnAbyBoardCode(int boardCode);					//게시판코드로
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	//페이징(상품문의내역만)
	 List<Map<String, Object>> SelectMyPdQnAList (
			 @Param("memberId") String memberId, @Param("pageSearch") int pageSearch, @Param("cntPerPage") int cntPerPage);
	
	 int MyPdQnACount(String memberId);
	 
		//페이징(일반문의내역만)
	 List<Map<String, Object>> SelectMyNmQnAList (
			 @Param("memberId") String memberId, @Param("pageSearch") int pageSearch, @Param("cntPerPage") int cntPerPage);
	
	 int MyNmQnACount(String memberId);
	 
	 
	
	///////////////////////////////

	
	//일반문의하기
	int insertNormalQnA(NormalQnARegistCommand qna); 		 //일반문의하기
	int updateNormalQnA(ModifyMyNormalQnACommend qna);  				//일반문의내용 수정
	
	
//	int insertMember(MyQnaCommand req); 		 					//문의내ㅇ
	int deleteMember(long id);  							//문의내용 삭제
	
	
	
	

}
