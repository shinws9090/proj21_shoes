package proj21_shoes.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import proj21_shoes.dto.Order;
import proj21_shoes.mapper.OrderMapper;
import proj21_shoes.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	private OrderMapper mapper;
	
	@Transactional
	@Override
	public int insertOrder(Order order) {
		int res =0;
		res += mapper.insertOrder(order);
		res += mapper.insertOrderProduct(order);
		res += mapper.insertAddress(order);
		
		return res;
	}
	
	
}
