package proj21_shoes.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import proj21_shoes.commend.MemberDetailAgesCommend;
import proj21_shoes.commend.MemberDetailUpdateCommend;
import proj21_shoes.commend.MyPWConfirmCommand;
import proj21_shoes.dto.MemberDetail;

@Component
public interface MemberDetailMapper {//우선 회원가입용!! 회원가입시는 회원상세정보테이블만 사용해도 될것같다.
									//회원정보 테이블  -회원코드,회원아이디,포인트,누적구매금액,등급코드,탈퇴여부,가입일
	List<MemberDetail> selectMemberDetailAll();	//회원상세정보 검색- 회원아이디, 회원비밀번호,회원이름,성별,생년월일,이메일,연락처,우편번호,주소,상세주소		
									
	//~로 검색  (모든 조건으로 검색할수있어야??)
	MemberDetail selectMemberDetailById(String string);//수정필요 MemberDetail
	MemberDetail selectMemberByNameEmail(String memberName, String email);
	MemberDetail selectPwdByIdNameEmail(String memberId, String memberName, String email);

	MyPWConfirmCommand selectConfirmPw(String memberId, String memberPw);
	
	int insertMemberDetail(MemberDetail req); 		 //회원상세정보 추가
	int updateMemberDetail(MemberDetailUpdateCommend memberDetail);  	//회원상세정보 수정
	int updateMemberPW(String memberId, String memberPW);  	//회원비밀번호 수정
	int deleteMemberDetail(long id);  						//회원상세정보 삭제
	
	public List<MemberDetailAgesCommend> memberListByAges();
	
	public List<MemberDetailAgesCommend> memberListByGender();
}
