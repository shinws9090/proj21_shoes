package proj21_shoes.mapper;

import java.util.List;

import proj21_shoes.commend.ReviewCommand;
import proj21_shoes.dto.ReView;

public interface ReviewMapper {
	

	List<ReView> selectReviewByProductCode(int productCode);
	List<ReviewCommand> selectProductReviewbyCode(int productCode, int startrow, int limit);

	int updateProductCode(String ProductCode);
	int deleteProductCode(String ProductCode);
	
	int productReviewInsert(ReView review);
	int productReviewDelete(int boardCode);
	int productReviewUpdate(ReView review);
	int selectProductReviewCount(int code);

}
