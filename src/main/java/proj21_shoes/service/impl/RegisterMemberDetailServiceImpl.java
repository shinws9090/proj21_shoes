package proj21_shoes.service.impl;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shoes.dto.MemberDetail;
import proj21_shoes.dto.RegisterRequest;
import proj21_shoes.exeption.DuplicateMemberException;
import proj21_shoes.mapper.MemberDetailMapper;
import proj21_shoes.service.RegisterMemberDetailService;
@Service
public class RegisterMemberDetailServiceImpl implements RegisterMemberDetailService {
	static final Log log = LogFactory.getLog(RegisterMemberDetailServiceImpl.class);
	
	@Autowired
	private MemberDetailMapper mapper;

	@Override
	public MemberDetail regist(RegisterRequest req) {//이 형식의 애를 받아서
		MemberDetail member = mapper.selectMemberDetailById(req.getMemberId());//(req.getEmail());
		if (member != null) {
			throw new DuplicateMemberException("dup email " + req.getEmail());
		}
		RegisterRequest newMember = new RegisterRequest(req.getMemberId(),req.getMemberPwd(),req.getConfirmPassword(),req.getMemberName(),req.getGender(),req.getBirthday(),req.getEmail(),req.getTel(),req.getZipCode(),req.getAddress(), req.getDetailAddress());
		mapper.insertMemberDetail(newMember);
		return newMember.getMemberId();

	}
	

}
