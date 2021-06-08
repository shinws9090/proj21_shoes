package proj21_shoes.service;

import org.springframework.stereotype.Service;

import proj21_shoes.dto.MemberDetail;
@Service
public interface RegisterMemberDetailService {


	int regist(MemberDetail req);
	MemberDetail selectById(String req);  //입력한 id로 상세정보 확인용!
	

}
