package proj21_shoes.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import proj21_shoes.commend.MyQnaCommand;

@Component
public interface MyQnaMapper {
										
//	List<MyQnaCommand> selectMyQnaAll();	
									
	
	
	//상품문의내역만 검색
	List<MyQnaCommand> selectProductQnAbyId(String member);					//회원아이디로
	MyQnaCommand selectProductQnAbyBoardCode(int boardCode);					//게시판코드로
	
	//일반문의내역만 검색
	List<MyQnaCommand> selectNormalQnAbyId(String member);					//회원아이디로
	MyQnaCommand selectNormalQnAbyBoardCode(int boardCode);					//게시판코드로
	
	
	
	
//	int insertMember(MyQnaCommand req); 		 					//문의내ㅇ
	int updateMember(String member);  				//문의내용 수정
	int deleteMember(long id);  							//문의내용 삭제
	
	
	
	

}
