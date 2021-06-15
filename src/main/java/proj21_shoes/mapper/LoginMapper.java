package proj21_shoes.mapper;

import org.springframework.stereotype.Component;

import proj21_shoes.commend.LoginCommand2;

@Component
public interface LoginMapper {
	LoginCommand2 loginIdPw(String membeId, String memberPwd);

}
