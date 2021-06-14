package proj21_shoes.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import proj21_shoes.commend.AuthInfoCommend;
import proj21_shoes.dto.Member;
import proj21_shoes.dto.MemberDetail;
import proj21_shoes.exeption.QuitMemberException;
import proj21_shoes.exeption.WrongIdPasswordException;
import proj21_shoes.mapper.MemberDetailMapper;
import proj21_shoes.mapper.MemberMapper;

@Component
public class AuthService {
	@Autowired
	private MemberDetailMapper mapper;
	@Autowired
	private MemberMapper mapper2;

	public AuthInfoCommend authenicate(String memberId, String password) { 	 //아이디랑 비번 입력받아서
		MemberDetail member = mapper.selectMemberDetailById(memberId);   //memberDetail에 있는앤지 id로 검색쓰
		Member member2 = mapper2.selectMemberById(memberId);  
		if (member == null) {
			throw new WrongIdPasswordException();
		}
		if (!member.matchPassword(password)) {
			throw new WrongIdPasswordException();
		}
		if(member2.isQuitState()) {
			throw new QuitMemberException();
		}
		return new AuthInfoCommend(member.getMemberId(), member.getEmail(), member.getMemberName());
	}
	
	public Member memberVo(String memberId) {
		MemberDetail memberDetail = mapper.selectMemberDetailById(memberId);   //memberDetail에 있는앤지 id로 검색쓰
		Member member = mapper2.selectMemberById(memberId);
		member.setMemberId(memberDetail);
		return member;
	}
}
