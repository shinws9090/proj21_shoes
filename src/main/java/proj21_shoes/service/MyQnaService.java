package proj21_shoes.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_shoes.commend.MyQnaCommand;
@Service
public interface MyQnaService {
	
	//상품문의내역만 검색
	List<MyQnaCommand> selectProductQnAbyId(String member);					//회원아이디로
	MyQnaCommand selectProductQnAbyBoardCode(int boardCode);					//게시판코드로


	
	//일반문의내역만 검색
	List<MyQnaCommand> selectNormalQnAbyId(String member);					//회원아이디로
	MyQnaCommand selectNormalQnAbyBoardCode(int boardCode);					//게시판코드로
}
