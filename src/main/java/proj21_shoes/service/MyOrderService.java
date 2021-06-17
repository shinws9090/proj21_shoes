package proj21_shoes.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_shoes.commend.MyOrderCommend;

@Service
public interface MyOrderService {
	List<MyOrderCommend> selectMyOrderById(String memberid);					//회원id로 검색

}
