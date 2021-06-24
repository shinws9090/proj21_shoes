package proj21_shoes.mapper;

import java.util.List;

import proj21_shoes.commend.MyQnaViewCommand;
import proj21_shoes.dto.Qna;

public interface ProductQnaMapper {

	List<MyQnaViewCommand> selectProductQnAbyCode(int productCode,int page,int limit);

	int productQnAInsert(Qna qna);

	int productQnADelete(int boardCode);

	int productQnAUpdate(Qna qna);

	int selectProductQnACount(int code);

}
