package proj21_shoes.service.impl;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shoes.dto.MemberDetail;
import proj21_shoes.mapper.MemberDetailMapper;
import proj21_shoes.service.GetMemberDetailService;
@Service
public class GetMemberDetailServiceImpl implements GetMemberDetailService {

	static final Log log = LogFactory.getLog(GetMemberDetailServiceImpl.class);
	
	@Autowired
	private MemberDetailMapper mapper;
	
	@Override
	public MemberDetail getMemberDetail(MemberDetail id) {  //회원 개인별 상세정보조회
		log.debug("service - GetMemberDetail() > " +id);
		return mapper.selectMemberDetailById(id);
	}

}
