package proj21_shoes.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shoes.commend.MyOrderCommend;
import proj21_shoes.mapper.MyOrderMapper;
import proj21_shoes.service.MyOrderService;
@Service
public class MyOrderServiceImpl implements MyOrderService {
	@Autowired
	MyOrderMapper mapper;
	
	
	@Override
	public MyOrderCommend selectMyOrderById(String memberid) {
		return mapper.selectMyOrderById(memberid);
	}

}
