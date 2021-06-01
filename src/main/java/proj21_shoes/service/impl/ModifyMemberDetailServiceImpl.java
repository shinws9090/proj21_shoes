package proj21_shoes.service.impl;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shoes.dto.MemberDetail;
import proj21_shoes.mapper.MemberDetailMapper;
import proj21_shoes.service.ModifyMemberDetailService;
@Service
public class ModifyMemberDetailServiceImpl implements ModifyMemberDetailService {
	static final Log log = LogFactory.getLog(ModifyMemberDetailServiceImpl.class);
	@Autowired
	private MemberDetailMapper mapper;
	
	@Override
	public int modifyMemberDetail(MemberDetail memberDetail) {
		log.debug("service - modifyMemberDetail() > " + memberDetail);
		return mapper.updateMemberDetail(memberDetail);
	}

}
