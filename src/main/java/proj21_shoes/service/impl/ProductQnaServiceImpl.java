package proj21_shoes.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shoes.commend.MyQnaViewCommand;
import proj21_shoes.dto.Qna;
import proj21_shoes.mapper.ProductQnaMapper;
import proj21_shoes.service.ProductQnaService;

@Service
public class ProductQnaServiceImpl implements ProductQnaService {
	
	@Autowired
	private ProductQnaMapper mapper;
	
	@Override
	public List<MyQnaViewCommand> selectProductQnAbyCode(int productCode,int page) {
		int limit = 2;
		int startrow = (page - 1) * limit;
		
		return mapper.selectProductQnAbyCode(productCode,startrow,limit);
	}

	@Override
	public int productQnAInsert(Qna qna) {
		return mapper.productQnAInsert(qna);
	}

	@Override
	public int productQnADelete(int boardCode) {
		return mapper.productQnADelete(boardCode);
	}

	@Override
	public int productQnAUpdate(Qna qna) {
		return mapper.productQnAUpdate(qna);
	}

	@Override
	public int selectProductQnACount(int code) {
		return mapper.selectProductQnACount(code);
	}

}
