package proj21_shoes.mapper;

import java.util.List;

import proj21_shoes.dto.OrderOption;

public interface OrderOptionMapper {
	List<OrderOption> orderOptionByProductCode(int productCode);
	
	List<OrderOption> orderOptionByAllList();
	
	int insertOrderOption(OrderOption orderOption);

	int updateOrderOption(OrderOption orderOption);
	
	int deleteOrderOption(OrderOption orderOption);
}
