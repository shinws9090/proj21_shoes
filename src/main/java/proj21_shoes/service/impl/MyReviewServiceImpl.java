package proj21_shoes.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shoes.commend.MyReviewCommend;
import proj21_shoes.commend.Pagination;
import proj21_shoes.commend.SearchCriteria;
import proj21_shoes.dto.ReView;
import proj21_shoes.mapper.MyReviewMapper;
import proj21_shoes.service.MyReviewService;

@Service
public class MyReviewServiceImpl implements MyReviewService {

	@Autowired
	private MyReviewMapper mapper;
	
	@Override
	public List<ReView> selectReviewbyAllList() {
		// TODO Auto-generated method stub
		return mapper.selectReviewbyAllList();
	}
	
	@Override
	public List<Map<String, Object>> SelectMyReviewList(String memberId, Pagination pagination) throws Exception {
		return mapper.SelectMyReviewList(memberId, pagination.getPageSearch(), pagination.getCntPerPage());
	}

	@Override
	public int MyReviewCount(String memberId) throws Exception {
		return mapper.MyReviewCount(memberId);

	}

	@Override
	public MyReviewCommend selectMyReviewByBoardCode(int boardCode) {
		return mapper.selectMyReviewByBoardCode(boardCode);
	}

	@Override
	public MyReviewCommend selectMyReviewByOrderCode(int orderCode) {
		return mapper.selectMyReviewByOrderCode(orderCode);
	}

	@Override
	public List<Map<String, Object>> SelectReviewPlzList(String memberId, Pagination pagination) throws Exception {
		return mapper.SelectReviewPlzList(memberId, pagination.getPageSearch(), pagination.getCntPerPage());
	}

	@Override
	public int MyReviewPlzListCount(String memberId) throws Exception {
		return mapper.MyReviewPlzListCount(memberId);
	}

	@Override
	public List<MyReviewCommend> findAll(SearchCriteria scri) throws Exception {
		return mapper.findAll(scri);
	}

	@Override
	public int countInfoList(SearchCriteria scri) throws Exception {
		return mapper.countInfoList(scri);
	}

	@Override
	public MyReviewCommend detailView(int boardCode) throws Exception {
		return mapper.detailView(boardCode);
	}

	@Override
	public int deleteReview(int boardCode) {
		return mapper.deleteReview(boardCode);
	}

}
