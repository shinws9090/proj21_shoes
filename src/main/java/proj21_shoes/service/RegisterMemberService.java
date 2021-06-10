package proj21_shoes.service;

import org.springframework.stereotype.Service;

import proj21_shoes.dto.Member;
@Service
public interface RegisterMemberService {


	int regist(Member req);
	Member selectByMCode(int req);  //입력한 id로 회원정보 확인용!
	
	Member selectMemberById(String string);					//회원아이디로 검색
}
