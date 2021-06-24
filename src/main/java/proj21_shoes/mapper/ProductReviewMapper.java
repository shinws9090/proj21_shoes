package proj21_shoes.mapper;

import java.util.List;

import proj21_shoes.dto.ReView;

public interface ProductReviewMapper {

	List<ReView> selectProductReviewbyCode(int productCode, int startrow, int limit);

	ReView selectReviewbyBoardCode(int boardCode);
	
	int productReviewInsert(ReView reView);

	int productReviewDelete(int boardCode);

	int productReviewUpdate(ReView reView);

	int selectProductReviewCount(int code);

	List<Integer> selectOrderCode(int memberCode, int productCode);


}
