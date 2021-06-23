package proj21_shoes.service;

import org.springframework.stereotype.Service;

import proj21_shoes.dto.OrderOption;

@Service
public interface OrderOptionService {
	int insertOrderOption(OrderOption orderOption);
	int updateOrderOption(OrderOption orderOption);
}
