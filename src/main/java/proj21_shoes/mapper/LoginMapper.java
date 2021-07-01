package proj21_shoes.mapper;

import org.springframework.stereotype.Component;

import proj21_shoes.commend.AdminLoginCommend;
import proj21_shoes.commend.LoginCommand2;

@Component
public interface LoginMapper {
	//회원로그인
	LoginCommand2 loginIdPw(String membeId, String memberPwd);
	
	//관리자로그인
	AdminLoginCommend adminLoginIdPw(String adminId, String adminPwd);

}
