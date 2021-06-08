package proj21_shoes.service.impl;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shoes.dto.MemberDetail;
import proj21_shoes.mapper.MemberDetailMapper;
import proj21_shoes.service.RegisterMemberDetailService;
@Service
public class RegisterMemberDetailServiceImpl implements RegisterMemberDetailService {
	static final Log log = LogFactory.getLog(RegisterMemberDetailServiceImpl.class);
	
	@Autowired
	private MemberDetailMapper mapper;

	@Override
	public int regist(MemberDetail req) {//이 형식의 애를 받아서
		mapper.insertMemberDetail(req);
		return 1;

	}

	@Override
	public MemberDetail selectById(String req) {
		return mapper.selectMemberDetailById(req);
		}


	

}
