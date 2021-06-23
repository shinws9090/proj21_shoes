package proj21_shoes.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shoes.dto.OrderOption;
import proj21_shoes.mapper.OrderOptionMapper;
import proj21_shoes.service.OrderOptionService;

@Service
public class OrderOptionServiceImpl implements OrderOptionService {

	@Autowired
	OrderOptionMapper mapper;
	
	@Override
	public int insertOrderOption(OrderOption orderOption) {
		return mapper.insertOrderOption(orderOption);
	}

	@Override
	public int updateOrderOption(OrderOption orderOption) {
		return mapper.updateOrderOption(orderOption);
	}

}
