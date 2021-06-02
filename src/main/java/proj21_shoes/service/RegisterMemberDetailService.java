package proj21_shoes.service;

import javax.validation.Valid;

import org.springframework.stereotype.Service;

import proj21_shoes.dto.MemberDetail;
import proj21_shoes.dto.RegisterRequest;
@Service
public interface RegisterMemberDetailService {


	Long regist(RegisterRequest req);

}
