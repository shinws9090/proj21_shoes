package proj21_shoes.mapper;

import java.util.List;

import proj21_shoes.commend.MyQnaViewCommand;

public interface ProductQnaMapper {

	List<MyQnaViewCommand> selectProductQnAbyCode(int productCode);

}
