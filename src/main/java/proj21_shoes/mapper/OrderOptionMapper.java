package proj21_shoes.mapper;

import java.util.List;

import proj21_shoes.commend.SearchCriteria;
import proj21_shoes.dto.OrderOption;

public interface OrderOptionMapper {
	List<OrderOption> orderOptionByProductCode(int productCode);
	
	List<OrderOption> orderOptionByAllList();
	
	int insertOrderOption(OrderOption orderOption);

	int updateOrderOption(OrderOption orderOption);
	
	int deleteOrderOption(OrderOption orderOption);
	
	// 리스트 + 검색 + 페이징
	public List<OrderOption> findAll(SearchCriteria scri) throws Exception;
		
	// 리스트 + 검색 + 페이징 (게시물 총 개수 구하기)
	public int countInfoList(SearchCriteria scri) throws Exception;
}
