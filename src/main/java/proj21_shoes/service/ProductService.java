package proj21_shoes.service;

import java.util.List;

import proj21_shoes.commend.ProductSelectCommend;
import proj21_shoes.dto.Brand;
import proj21_shoes.dto.OrderOption;
import proj21_shoes.dto.Product;


public interface ProductService {
	List<Product> productByAll();
	List<Product> productByOnlyProuct();
	List<Product> productByMenu(String menu);
	List<Brand> brandByAll();
	Product productByCode(int code);
	List<Product> productByBrand(int code);
	List<Product> productBycommand(ProductSelectCommend productSelectCommend);
	
	List<OrderOption> OrderOptionBy1(int code);
	List<OrderOption> OrderOptionBy2(int styleCode, int code);
	OrderOption OrderOptionBy3(int styleCode, int code, int size);
	
	int insertProduct(Product product);
	int updateProduct(Product product);
	int deleteProduct(int code);
	List<Brand> brandBySel(String code);
}
