package proj21_shoes.service;

import org.springframework.stereotype.Service;

import proj21_shoes.commend.AdminLoginCommend;
import proj21_shoes.commend.LoginCommand2;

@Service
public interface LoginService {
	
	LoginCommand2 loginIdPw(String membeId, String memberPwd);
	//관리자로그인
		AdminLoginCommend adminLoginIdPw(String adminId, String adminPwd);


}
