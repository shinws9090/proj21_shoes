package proj21_shoes.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_shoes.commend.ModifyMyNormalQnA;
import proj21_shoes.commend.MyQnaViewCommand;
import proj21_shoes.commend.NormalQnARegistCommand;
@Service
public interface MyQnaService {
	
	//상품문의내역만 검색
	List<MyQnaViewCommand> selectProductQnAbyId(String member);					//회원아이디로
	MyQnaViewCommand selectProductQnAbyBoardCode(int boardCode);					//게시판코드로


	
	//일반문의내역만 검색
	List<MyQnaViewCommand> selectNormalQnAbyId(String member);					//회원아이디로
	MyQnaViewCommand selectNormalQnAbyBoardCode(int boardCode);					//게시판코드로
	
	//일반문의하기
	int insertNormalQnA(NormalQnARegistCommand qna); 		 //일반문의하기
	
	int updateNormalQnA(ModifyMyNormalQnA updateQnA);  				//일반문의내용 수정

	
}
