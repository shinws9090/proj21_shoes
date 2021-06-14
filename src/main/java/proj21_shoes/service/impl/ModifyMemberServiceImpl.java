package proj21_shoes.service.impl;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shoes.dto.Member;
import proj21_shoes.mapper.MemberMapper;
import proj21_shoes.service.ModifyMemberService;
@Service
public class ModifyMemberServiceImpl implements ModifyMemberService {
	static final Log log = LogFactory.getLog(ModifyMemberServiceImpl.class);
	
	@Autowired
	private MemberMapper mapper;
	
	
	@Override
	public int modifyMember(String member) {
		log.debug("service - modifyMember() > " + member);
		return mapper.updateMember(member);
	}

	@Override
	public Member selectMemberById(String memberId) {
	
		return mapper.selectMemberById(memberId);
	}

}
