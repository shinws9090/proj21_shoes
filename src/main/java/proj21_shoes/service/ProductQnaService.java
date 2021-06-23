package proj21_shoes.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_shoes.commend.MyQnaViewCommand;
import proj21_shoes.dto.Qna;
@Service
public interface ProductQnaService {
	

	List<MyQnaViewCommand> selectProductQnAbyCode(int productCode);					


	
}
