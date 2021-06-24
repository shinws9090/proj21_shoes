package proj21_shoes.mapper;

import java.util.List;

import proj21_shoes.dto.Member;
import proj21_shoes.dto.Order;

public interface OrderMapper {
	
	List<Order>selectOrderList(); 
	
	int insertOrder(Order order);
	int insertOrderProduct(Order order);
	int insertAddress(Order order);
	void updateMemberPoint(Member member);
	
	
}
