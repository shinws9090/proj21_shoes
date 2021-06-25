package proj21_shoes.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shoes.dto.ReView;
import proj21_shoes.dto.ReviewImage;
import proj21_shoes.mapper.ProductReviewMapper;
import proj21_shoes.service.ProductReviewService;

@Service
public class ProductReviewServiceImpl implements ProductReviewService {
	
	@Autowired
	private ProductReviewMapper mapper;
	

	@Override
	public List<ReView> selectProductReviewbyCode(int productCode, int page) {
		int limit = 5;
		int startrow = (page - 1) * limit;
		
		return mapper.selectProductReviewbyCode(productCode,startrow,limit);
	}

	@Override
	public int productReviewInsert(ReView reView) {
		return mapper.productReviewInsert(reView);
	}

	@Override
	public int productReviewDelete(int boardCode) {
		return mapper.productReviewDelete(boardCode);
	}

	@Override
	public int productReviewUpdate(ReView reView) {
		return mapper.productReviewUpdate(reView);
	}

	@Override
	public int selectProductReviewCount(int code) {
		return mapper.selectProductReviewCount(code);
	}

	@Override
	public ReView selectReviewbyBoardCode(int boardCode) {
		return mapper.selectReviewbyBoardCode(boardCode);
	}

	@Override
	public List<Integer> selectOrderCode(int memberCode, int productCode) {
		return mapper.selectOrderCode(memberCode,productCode);
	}

	@Override
	public int imageInsert(ReviewImage image) {
		return mapper.imageInsert(image);
	}

	@Override
	public int imageDelete(int boardCode) {
		return mapper.imageDelete(boardCode);
	}

}
