package proj21_shoes.service;

import org.springframework.stereotype.Service;

import proj21_shoes.commend.MyOrderCommend;

@Service
public interface MyOrderService {
	MyOrderCommend selectMyOrderById(String memberid);					//회원id로 검색

}
