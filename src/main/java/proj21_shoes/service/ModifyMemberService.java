package proj21_shoes.service;

import org.springframework.stereotype.Service;

import proj21_shoes.dto.Member;

@Service
public interface ModifyMemberService { //우선 회원삭제용
	int modifyMember(String memberId); 							 //회원탈퇴 true 
	Member selectMemberById(String memberId);					//회원아이디로 검색
}
