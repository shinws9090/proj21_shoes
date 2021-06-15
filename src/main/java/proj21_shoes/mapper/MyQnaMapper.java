package proj21_shoes.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import proj21_shoes.commend.MyQnaCommand;

@Component
public interface MyQnaMapper {
										
//	List<MyQnaCommand> selectMyQnaAll();	
									
	//~로 검색  (모든 조건으로 검색할수있어야??)
	//MyQnaCommand selectbyId(Member member);					//회원아이디로
	List<MyQnaCommand> selectbyId(String member);					//회원아이디로
//MyQnaCommand selectMemberById(String memberId);					//회원아이디로 검색
	
	
//	int insertMember(MyQnaCommand req); 		 					//문의내ㅇ
	int updateMember(String member);  				//문의내용 수정
	int deleteMember(long id);  							//문의내용 삭제
	
	
	
	

}
