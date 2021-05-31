package proj21_shoes.mapper;

import java.util.List;

import proj21_shoes.dto.Product;

public interface ProductMapper {
	
	List<Product> productByAll();
	List<Product> productByMenu(String menu);
		
	
}
