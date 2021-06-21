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
	public List<MyQnaCommand> selectbyId(String member){					//회원아이디로
		
		return mapper.selectbyId(member);
	}

	@Override
	public MyQnaCommand selectbyBoardCode(int boardCode) {
		return mapper.selectbyBoardCode(boardCode);
	}

}
