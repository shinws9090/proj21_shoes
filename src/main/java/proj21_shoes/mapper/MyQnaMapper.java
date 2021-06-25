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

	
	
	
	

}
