package proj21_shoes.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import proj21_shoes.commend.LoginCommand2;
import proj21_shoes.mapper.LoginMapper;
import proj21_shoes.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	LoginMapper mapper;
	
	@Override
	public LoginCommand2 loginIdPw(String membeId, String memberPwd) {
	
		return mapper.loginIdPw(membeId, memberPwd);
	}

}
