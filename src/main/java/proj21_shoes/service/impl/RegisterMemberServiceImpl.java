package proj21_shoes.service.impl;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shoes.dto.Member;
import proj21_shoes.mapper.MemberMapper;
import proj21_shoes.service.RegisterMemberService;
@Service
public class RegisterMemberServiceImpl implements RegisterMemberService {
	static final Log log = LogFactory.getLog(RegisterMemberServiceImpl.class);
	
	@Autowired
	private MemberMapper mapper;


	@Override
	public int regist(Member req) {
		return mapper.insertMember(req);
	}

	@Override
	public Member selectByMCode(int req) {
		return mapper.selectMemberByMCode(req);
	}

	@Override
	public Member selectMemberById(String string) {
		return mapper.selectMemberById(string);
	}

}
