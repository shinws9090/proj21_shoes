package proj21_shoes.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import proj21_shoes.dto.Member;

@Component
public interface MemberMapper {
											//회원정보 테이블  -회원코드,회원아이디,포인트,누적구매금액,등급코드,탈퇴여부,가입일
	List<Member> selectMemberAll();	//회원상세정보 검색- 회원아이디, 회원비밀번호,회원이름,성별,생년월일,이메일,연락처,우편번호,주소,상세주소		
									
	//~로 검색  (모든 조건으로 검색할수있어야??)
	Member selectMemberByMCode(int string);					//회원코드로 검색
	Member selectMemberById(String memberId);					//회원아이디로 검색
	
	int insertMember(Member req); 		 					//회원정보 추가
	int updateMember(Member memberDetail);  				//회원정보 수정
	int deleteMember(long id);  							//회원정보 삭제
	
	

}
