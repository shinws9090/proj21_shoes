package proj21_shoes.service;

import org.springframework.stereotype.Service;

import proj21_shoes.commend.MyPageSelectCommend;

@Service
public interface GetMyPageService {
	
	MyPageSelectCommend showMyPageById(String memberid);					//회원id로 검색


}
