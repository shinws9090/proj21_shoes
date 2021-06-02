package proj21_shoes.service.impl;

import javax.validation.Valid;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shoes.dto.MemberDetail;
import proj21_shoes.dto.RegisterRequest;
import proj21_shoes.mapper.MemberDetailMapper;
import proj21_shoes.service.RegisterMemberDetailService;
@Service
public class RegisterMemberDetailServiceImpl implements RegisterMemberDetailService {
	static final Log log = LogFactory.getLog(RegisterMemberDetailServiceImpl.class);
	
	@Autowired
	private MemberDetailMapper mapper;

	@Override
	public Long regist(RegisterRequest req) {
		MemberDetail member = mapper.selectMemberDetailById(req.getId())//(req.getEmail());
		if (member != null) {
			throw new DuplicateMemberException("dup email " + req.getEmail());
		}
		MemberDetail newMember = new MemberDetail(req.getEmail(), req.getPassword(), req.getName(), LocalDateTime.now());
		mapper.insertMemberDetail(newMember);
		return newMember.getId();
	}
	

}
