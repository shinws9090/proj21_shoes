package proj21_shoes.service;

import java.util.List;

import proj21_shoes.dto.Brand;
import proj21_shoes.dto.OrderOption;
import proj21_shoes.dto.Product;

public interface ProductService {
	List<Product> productByAll();
	List<Product> productByMenu(String menu);
	List<Brand> brandByAll();
	Product productByCode(int code);
	List<OrderOption> OrderOptionByCode(int code);
	List<Product> productByBrand(int code);
}
