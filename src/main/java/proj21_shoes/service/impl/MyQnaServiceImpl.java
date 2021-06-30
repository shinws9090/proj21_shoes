package proj21_shoes.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shoes.commend.ModifyMyNormalQnACommend;
import proj21_shoes.commend.MyQnaViewCommand;
import proj21_shoes.commend.NormalQnARegistCommand;
import proj21_shoes.commend.Pagination;
import proj21_shoes.commend.SearchCriteria;
import proj21_shoes.mapper.MyQnaMapper;
import proj21_shoes.service.MyQnaService;

@Service
public class MyQnaServiceImpl implements MyQnaService {

	@Autowired
	private MyQnaMapper mapper;

	@Override
	public List<MyQnaViewCommand> selectQnAbyAll() {
		return mapper.selectQnAbyAllList();
	}

	@Override
	public MyQnaViewCommand selectProductQnAbyBoardCode(int boardCode) {
		return mapper.selectProductQnAbyBoardCode(boardCode);
	}

	@Override
	public MyQnaViewCommand selectNormalQnAbyBoardCode(int boardCode) {
		return mapper.selectNormalQnAbyBoardCode(boardCode);
	}

	@Override
	public int insertNormalQnA(NormalQnARegistCommand qna) {
		return mapper.insertNormalQnA(qna);
	}

	@Override
	public int updateNormalQnA(ModifyMyNormalQnACommend qna) {
		return mapper.updateNormalQnA(qna);
	}

	@Override
	public List<Map<String, Object>> SelectMyPdQnAList(String memberId, Pagination pagination) throws Exception {
		return mapper.SelectMyPdQnAList(memberId, pagination.getPageSearch(), pagination.getCntPerPage());

	}

	@Override
	public int MyPdQnACount(String memberId) throws Exception {
		return mapper.MyPdQnACount(memberId);

	}

	@Override
	public List<Map<String, Object>> SelectMyNmQnAList(String memberId, Pagination pagination) throws Exception {
		return mapper.SelectMyNmQnAList(memberId, pagination.getPageSearch(), pagination.getCntPerPage());
	}

	@Override
	public int MyNmQnACount(String memberId) throws Exception {
		return mapper.MyNmQnACount(memberId);

	}

	@Override
	public List<MyQnaViewCommand> findAll(SearchCriteria scri) throws Exception {
		return mapper.findAll(scri);
	}

	@Override
	public int countInfoList(SearchCriteria scri) throws Exception {
		return mapper.countInfoList(scri);
	}

}
