package proj21_shoes.service;

import java.util.List;

import proj21_shoes.dto.Order;

public interface OrderService {
	
	int insertOrder(Order order,List<Integer> codeList,int point);

}
