package proj21_shoes.service;

import org.springframework.stereotype.Service;

import proj21_shoes.dto.MemberDetail;
import proj21_shoes.dto.RegisterRequest;
@Service
public interface RegisterMemberDetailService {


	String regist(RegisterRequest req);
	String selectById(String req);  //입력한 id로 상세정보 확인용!
	

}
