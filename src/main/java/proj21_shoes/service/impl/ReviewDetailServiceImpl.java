package proj21_shoes.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shoes.commend.ReviewCommand;
import proj21_shoes.dto.ReView;
import proj21_shoes.mapper.ReviewMapper;
import proj21_shoes.service.ReviewDetailService;

@Service
public class ReviewDetailServiceImpl implements ReviewDetailService {
	
	@Autowired
	private ReviewMapper mapper;
	
	@Override
	public List<ReviewCommand> selectProductReviewbyCode(int productCode, int page) {
		
		int limit = 2;
		int startrow = (page -1) * limit;
		
		return mapper.selectProductReviewbyCode(productCode,startrow,limit);
		
	}
	
	@Override
	public int productReviewInsert(ReView review) {
		return mapper.productReviewInsert(review);
	}

	@Override
	public int productQReviewDelete(int boardCode) {
		return mapper.productReviewDelete(boardCode);
	}

	@Override
	public int productReviewUpdate(ReView review) {
		return mapper.productReviewUpdate(review);
	}

	@Override
	public int selectProductReviewCount(int code) {
		return mapper.selectProductReviewCount(code);
	}
	
	

}
