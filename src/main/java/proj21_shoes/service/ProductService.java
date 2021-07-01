package proj21_shoes.service;

import java.util.List;

import proj21_shoes.commend.ProductSelectCommend;
import proj21_shoes.commend.SearchCriteria;
import proj21_shoes.dto.Brand;
import proj21_shoes.dto.OrderOption;
import proj21_shoes.dto.Product;

public interface ProductService {
	List<Product> productByAll();

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

	int updateProductRegDateEmp(Product product);

	int deleteProduct(int code);

	List<Brand> brandBySel(String code);

	// 리스트 + 검색 + 페이징
	public List<Product> findAll(SearchCriteria scri) throws Exception;

	// 리스트 + 검색 + 페이징 (게시물 총 개수 구하기)
	public int countInfoList(SearchCriteria scri) throws Exception;
}
