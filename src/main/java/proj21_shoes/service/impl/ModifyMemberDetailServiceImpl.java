package proj21_shoes.service.impl;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shoes.commend.MemberDetailUpdateCommend;
import proj21_shoes.commend.MyPWConfirmCommand;
import proj21_shoes.mapper.MemberDetailMapper;
import proj21_shoes.service.ModifyMemberDetailService;
@Service
public class ModifyMemberDetailServiceImpl implements ModifyMemberDetailService {
	static final Log log = LogFactory.getLog(ModifyMemberDetailServiceImpl.class);
	@Autowired
	private MemberDetailMapper mapper;
	
	@Override
	public int modifyMemberDetail(MemberDetailUpdateCommend memberDetail) {
		log.debug("service - modifyMemberDetail() > " + memberDetail);
		return mapper.updateMemberDetail(memberDetail);
	}

	@Override
	public MyPWConfirmCommand selectConfirmPw(String memberId, String memberPw) {
		return mapper.selectConfirmPw(memberId, memberPw);
	}

	@Override
	public int updateMemberPW(String memberId, String memberPW) {
		
		return mapper.updateMemberPW(memberId, memberPW);
	}

}
