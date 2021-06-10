package proj21_shoes.mapper;

import org.springframework.stereotype.Component;

import proj21_shoes.commend.MyPageSelectCommend;

@Component
public interface MyPageSelectMapper {

	MyPageSelectCommend selectMyPageById(String memberid);					//회원id로 검색

}
