package proj21_shoes.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shoes.commend.MyQnaViewCommand;
import proj21_shoes.mapper.ProductQnaMapper;
import proj21_shoes.service.ProductQnaService;

@Service
public class ProductQnaServiceImpl implements ProductQnaService {
	
	@Autowired
	private ProductQnaMapper mapper;
	
	@Override
	public List<MyQnaViewCommand> selectProductQnAbyCode(int productCode) {
		return mapper.selectProductQnAbyCode(productCode);
	}

}
