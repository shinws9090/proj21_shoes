package proj21_shoes.service;

import org.springframework.stereotype.Service;

import proj21_shoes.commend.MemberDetailUpdateCommend;
import proj21_shoes.commend.MyPWConfirmCommand;
import proj21_shoes.dto.MemberDetail;

@Service
public interface ModifyMemberDetailService {
	int modifyMemberDetail(MemberDetailUpdateCommend updateMember);
	int updateMemberPW(String memberId, String memberPW);  	//회원비밀번호 수정
	MyPWConfirmCommand selectConfirmPw(String memberId, String memberPw);


}
