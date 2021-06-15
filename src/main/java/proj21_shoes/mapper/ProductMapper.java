package proj21_shoes.mapper;

import java.util.List;

import proj21_shoes.commend.ProductSelectCommend;
import proj21_shoes.dto.Brand;
import proj21_shoes.dto.OrderOption;
import proj21_shoes.dto.OrderProduct;
import proj21_shoes.dto.Product;

public interface ProductMapper {
	
	List<Product> productByAll();
	List<Product> productByMenu(String menu);
	List<Product> productByBrand(int code);
	List<Product> productBycommand(ProductSelectCommend productSelectCommend);
	List<Brand> BrandByAll();
	Product productByCode(int code);
	
	List<OrderOption> OrderOptionByCode(int code);
	List<OrderOption> OrderOptionByStyle(int styleCode, int code);
	OrderOption OrderOptionBy3(int styleCode, int code, int size);
		
	int insertProduct(Product product);
	int updateProduct(Product product);
	int deleteProduct(Product product);
	int updateOrderOptionStock(OrderProduct orderProduct);
}
