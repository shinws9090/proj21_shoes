package proj21_shoes.mapper;

import java.util.List;

import proj21_shoes.dto.ReView;

public interface ReviewMapper {
	
	List<ReView> selectReviewByProductCode(String productCode);
	
	int updateProductCode(String ProductCode);
	int deleteProductCode(String ProductCode);
}
