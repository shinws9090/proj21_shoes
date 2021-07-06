package proj21_shoes.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shoes.commend.SearchCriteria;
import proj21_shoes.dto.Member;
import proj21_shoes.mapper.MemberMapper;
import proj21_shoes.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberMapper mapper;
	
	@Override
	public List<Member> findAll(SearchCriteria scri) throws Exception {
		return mapper.findAll(scri);
	}

	@Override
	public int countInfoList(SearchCriteria scri) throws Exception {
		return mapper.countInfoList(scri);
	}

	@Override
	public int updateMyPoint(String memberId, int newPoint) {
		return mapper.updateMyPoint(memberId, newPoint);
	}

}
