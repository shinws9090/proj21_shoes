package proj21_shoes.service.impl;

import java.util.List;

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
	public List<OrderOption> orderOptionByProductCode(int productCode) {
		return mapper.orderOptionByProductCode(productCode);
	}

	@Override
	public List<OrderOption> orderOptionByAllList() {
		return mapper.orderOptionByAllList();
	}

	@Override
	public int insertOrderOption(OrderOption orderOption) {
		return mapper.insertOrderOption(orderOption);
	}

	@Override
	public int updateOrderOption(OrderOption orderOption) {
		return mapper.updateOrderOption(orderOption);
	}

	@Override
	public int deleteOrderOption(OrderOption orderOption) {
		return mapper.deleteOrderOption(orderOption);
	}

}
