package proj21_shoes.mapper;

import org.springframework.stereotype.Component;

import proj21_shoes.commend.MyOrderCommend;

@Component
public interface MyOrderMapper {

	MyOrderCommend selectMyOrderById(String memberid);					//회원id로 검색

}
