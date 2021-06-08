package proj21_shoes.service;

import java.util.List;

import proj21_shoes.commend.ProductSelectCommend;
import proj21_shoes.dto.Brand;
import proj21_shoes.dto.OrderOption;
import proj21_shoes.dto.Product;

public interface ProductService {
	List<Product> productByAll();
	List<Product> productByMenu(String menu);
	List<Brand> brandByAll();
	Product productByCode(int code);
	List<Product> productByBrand(int code);
	List<OrderOption> OrderOptionByCode(int code);
	List<Product> productBycommand(ProductSelectCommend productSelectCommend);
	List<OrderOption> OrderOptionByStyle(int styleCode, int code);
	
	int insertProduct(Product product);
	int updateProduct(Product product);
	int deleteProduct(Product product);
}
