package proj21_shoes.service;

import org.springframework.stereotype.Service;

import proj21_shoes.commend.LoginCommand2;

@Service
public interface LoginService {
	
	LoginCommand2 loginIdPw(String membeId, String memberPwd);


}
