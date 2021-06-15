package proj21_shoes.mapper;

import proj21_shoes.dto.Member;
import proj21_shoes.dto.Order;

public interface OrderMapper {
	
	int insertOrder(Order order);
	int insertOrderProduct(Order order);
	int insertAddress(Order order);
	void updateMemberPoint(Member member);
	
	
}
