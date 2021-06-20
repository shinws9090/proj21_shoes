package proj21_shoes.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import proj21_shoes.commend.MyOrderCommend;

@Component
public interface MyOrderMapper {

	List<MyOrderCommend> selectMyOrderById(String memberId);					//회원id로 검색
	MyOrderCommend selectMyOrderByOrderCode(int orderCode);					//주문코드로 검색

}
