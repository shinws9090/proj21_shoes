package proj21_shoes.mapper;

import java.util.List;

import proj21_shoes.dto.Brand;
import proj21_shoes.dto.OrderOption;
import proj21_shoes.dto.Product;

public interface ProductMapper {
	
	List<Product> productByAll();
	List<Product> productByMenu(String menu);
	List<Product> productByBrand(int code);
	List<Brand> BrandByAll();
	Product productByCode(int code);
	List<OrderOption> OrderOptionByCode(int code);
		
	
}
