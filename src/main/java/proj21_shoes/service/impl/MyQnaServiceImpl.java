package proj21_shoes.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shoes.commend.ModifyMyNormalQnA;
import proj21_shoes.commend.MyQnaViewCommand;
import proj21_shoes.commend.NormalQnARegistCommand;
import proj21_shoes.mapper.MyQnaMapper;
import proj21_shoes.service.MyQnaService;
@Service
public class MyQnaServiceImpl implements MyQnaService {
	
	@Autowired
	private MyQnaMapper mapper;

	@Override
	public List<MyQnaViewCommand> selectProductQnAbyId(String member){					//회원아이디로
		
		return mapper.selectProductQnAbyId(member);
	}

	@Override
	public MyQnaViewCommand selectProductQnAbyBoardCode(int boardCode) {
		return mapper.selectProductQnAbyBoardCode(boardCode);
	}

	@Override
	public List<MyQnaViewCommand> selectNormalQnAbyId(String member) {
		return mapper.selectNormalQnAbyId(member);
	}

	@Override
	public MyQnaViewCommand selectNormalQnAbyBoardCode(int boardCode) {
		return mapper.selectNormalQnAbyBoardCode(boardCode);
	}

	@Override
	public int insertNormalQnA(NormalQnARegistCommand qna) {
		return mapper.insertNormalQnA(qna);
	}

	@Override
	public int updateNormalQnA(ModifyMyNormalQnA qna) {
		return mapper.updateNormalQnA(qna);
	}

	

}
