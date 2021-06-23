package proj21_shoes.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_shoes.commend.ReviewCommand;
import proj21_shoes.dto.ReView;

@Service
public interface ReviewDetailService {
	

	List<ReviewCommand> selectProductReviewbyCode(int productCode, int page);

	int productReviewInsert(ReView review);

	int productQReviewDelete(int boardCode);

	int productReviewUpdate(ReView review);

	int selectProductReviewCount(int code);
	

}
