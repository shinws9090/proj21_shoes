package proj21_shoes.review;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_shoes.commend.ReviewCommand;

@Service
public interface ReviewDetailService {
	
	List<ReviewCommand> selectReviewProductbyCode(int productCode);
	

}
