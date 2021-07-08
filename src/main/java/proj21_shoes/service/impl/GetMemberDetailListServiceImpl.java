package proj21_shoes.service.impl;

import java.util.List;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shoes.commend.MemberDetailAgesCommend;
import proj21_shoes.dto.MemberDetail;
import proj21_shoes.mapper.MemberDetailMapper;
import proj21_shoes.service.GetMemberDetailListService;
@Service
public class GetMemberDetailListServiceImpl implements GetMemberDetailListService {
	static final Log log = LogFactory.getLog(GetMemberDetailListServiceImpl.class);

	@Autowired
	private MemberDetailMapper mapper;
	
	@Override
	public List<MemberDetail> getMemberDetailLists() {
		List<MemberDetail> list = mapper.selectMemberDetailAll();
		log.debug("service - getMemberDetailLists( >) " +list.size());
		return list;
	}

	@Override
	public List<MemberDetailAgesCommend> memberListByAges() {
		return mapper.memberListByAges();
	}

	@Override
	public List<MemberDetailAgesCommend> memberListByGender() {
		return mapper.memberListByGender();
	}

}
