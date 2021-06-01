package proj21_shoes.service.impl;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shoes.mapper.MemberDetailMapper;
@Service
public class RemoveMemberDetailServiceImpl implements proj21_shoes.service.RemoveMemberDetailService {
	static final Log log = LogFactory.getLog(RemoveMemberDetailServiceImpl.class);
	
	@Autowired
	private MemberDetailMapper mapper;
	@Override
	public int removeMemberDetail(long id) {
		log.debug("service - removeMemberDetailByNo() > " + id);
		return mapper.deleteMemberDetail(id);
	}

}
