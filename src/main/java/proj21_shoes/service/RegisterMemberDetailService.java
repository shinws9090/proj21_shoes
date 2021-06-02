package proj21_shoes.service;

import org.springframework.stereotype.Service;

import proj21_shoes.dto.MemberDetail;
import proj21_shoes.dto.RegisterRequest;
@Service
public interface RegisterMemberDetailService {


	String regist(RegisterRequest req);

}
