package proj21_shoes.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shoes.commend.ReviewCommand;
import proj21_shoes.mapper.ReviewMapper;

@Service
public class ReviewDetailServiceImpl implements ReviewDetailService {
	
	@Autowired
	private ReviewMapper mapper;
	
	@Override
	public List<ReviewCommand> selectReviewProductbyCode(int productCode) {
		return mapper.selectReviewbyProductCode(productCode);
		
	}
	

}
