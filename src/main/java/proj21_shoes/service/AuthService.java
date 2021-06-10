package proj21_shoes.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import proj21_shoes.commend.AuthInfoCommend;
import proj21_shoes.dto.MemberDetail;
import proj21_shoes.exeption.WrongIdPasswordException;
import proj21_shoes.mapper.MemberDetailMapper;

@Component
public class AuthService {
	@Autowired
	private MemberDetailMapper mapper;

	public AuthInfoCommend authenicate(String memberId, String password) { 	 //아이디랑 비번 입력받아서
		MemberDetail member = mapper.selectMemberDetailById(memberId);   //memberDetail에 있는앤지 id로 검색쓰
		if (member == null) {
			throw new WrongIdPasswordException();
		}
		if (!member.matchPassword(password)) {
			throw new WrongIdPasswordException();
		}
		return new AuthInfoCommend(member.getMemberId(), member.getEmail(), member.getMemberName());
	}
}
