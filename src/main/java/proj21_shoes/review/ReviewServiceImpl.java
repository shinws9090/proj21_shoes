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
	
	@Override
	public List<ReView> selectReviewByMember(String memberId) {
		return mapper.selectReviewByMemberId(memberId);
	}

	@Override
	public int getListCount() {
		return 0;
	}

	@Override
	public ArrayList<ReView> getArticleList(int page, int limit) {
		// TODO Auto-generated method stub
		return null;
	}

}
