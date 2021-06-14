package proj21_shoes.service.impl;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shoes.dto.MemberDetail;
import proj21_shoes.mapper.MemberDetailMapper;
import proj21_shoes.service.FindMemberIdPwService;
@Service
public class FindMemberIdPwServiceImpl implements FindMemberIdPwService {
	static final Log log = LogFactory.getLog(FindMemberIdPwServiceImpl.class);
	
	@Autowired
	private MemberDetailMapper mapper;
	

	@Override
	public MemberDetail selectMemberByNameEmail(String memberName, String email) {
		return mapper.selectMemberByNameEmail(memberName, email);
	}


	@Override
	public MemberDetail selectPwdByIdNameEmail(String memberId, String memberName, String email) {
		
		return mapper.selectPwdByIdNameEmail(memberId, memberName, email);
	}

}
