package proj21_shoes.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shoes.commend.MyQnaCommand;
import proj21_shoes.mapper.MyQnaMapper;
import proj21_shoes.service.MyQnaService;
@Service
public class MyQnaServiceImpl implements MyQnaService {
	
	@Autowired
	private MyQnaMapper mapper;

	@Override
	public List<MyQnaCommand> selectProductQnAbyId(String member){					//회원아이디로
		
		return mapper.selectProductQnAbyId(member);
	}

	@Override
	public MyQnaCommand selectProductQnAbyBoardCode(int boardCode) {
		return mapper.selectProductQnAbyBoardCode(boardCode);
	}

	@Override
	public List<MyQnaCommand> selectNormalQnAbyId(String member) {
		return mapper.selectNormalQnAbyId(member);
	}

	@Override
	public MyQnaCommand selectNormalQnAbyBoardCode(int boardCode) {
		return mapper.selectNormalQnAbyBoardCode(boardCode);
	}

}
