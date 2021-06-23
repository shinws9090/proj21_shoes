package proj21_shoes.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_shoes.dto.OrderOption;

@Service
public interface OrderOptionService {
	List<OrderOption> orderOptionByProductCode(int productCode);
	
	int insertOrderOption(OrderOption orderOption);
	int updateOrderOption(OrderOption orderOption);
}
