package proj21_shoes.review;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shoes.dto.ReView;
import proj21_shoes.mapper.ReviewMapper;


@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewMapper mapper;
	
	public List<ReView> selectReviewByProductCode(int productCode) {
		return mapper.selectReviewByProductCode(productCode);
	}
	
	@Override
	public List<ReView> selectReviewByBoardCode(int boardCode) {
		return mapper.selectReviewByBoardCode(boardCode);
	}
	
	
	@Override
	public int getListCount() {
		return 0;
	}

	@Override
	public ArrayList<ReView> getArticleList(int page, int limit) {
		return null;
	}

	public static ReviewServiceImpl getInstance() {
		return null;
	}


	@Override
	public int productReviewInsert(ReView reivew) {
		return 0;
	}


	@Override
	public int productReviewDelete(int boardCode) {
		return 0;
	}


	@Override
	public int productReviewUpdate(ReView reivew) {
		return 0;
	}


	@Override
	public int selectProductReviewCount(int code) {
		return 0;
	}


	
}
