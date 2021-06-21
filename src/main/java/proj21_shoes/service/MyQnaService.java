package proj21_shoes.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_shoes.commend.MyQnaCommand;
@Service
public interface MyQnaService {
	
	List<MyQnaCommand> selectbyId(String member);					//회원아이디로
	MyQnaCommand selectbyBoardCode(int boardCode);					//게시판코드로


}
