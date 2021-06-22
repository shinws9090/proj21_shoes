package proj21_shoes.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import proj21_shoes.commend.MyQnaViewCommand;
import proj21_shoes.commend.NormalQnARegistCommand;
import proj21_shoes.dto.MemberDetail;

@Component
public interface MyQnaMapper {
										
//	List<MyQnaCommand> selectMyQnaAll();	
									
	
	
	//상품문의내역만 검색
	List<MyQnaViewCommand> selectProductQnAbyId(String member);					//회원아이디로
	MyQnaViewCommand selectProductQnAbyBoardCode(int boardCode);					//게시판코드로
	
	//일반문의내역만 검색
	List<MyQnaViewCommand> selectNormalQnAbyId(String member);					//회원아이디로
	MyQnaViewCommand selectNormalQnAbyBoardCode(int boardCode);					//게시판코드로
	
	//일반문의하기
	int insertNormalQnA(NormalQnARegistCommand qna); 		 //일반문의하기
	
	
//	int insertMember(MyQnaCommand req); 		 					//문의내ㅇ
	int updateMember(String member);  				//문의내용 수정
	int deleteMember(long id);  							//문의내용 삭제
	
	
	
	

}
