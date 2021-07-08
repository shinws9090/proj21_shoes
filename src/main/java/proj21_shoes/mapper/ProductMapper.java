package proj21_shoes.mapper;

import java.util.List;

import proj21_shoes.commend.MyQnaViewCommand;
import proj21_shoes.commend.ProductSelectCommend;
import proj21_shoes.commend.SearchCriteria;
import proj21_shoes.dto.Brand;
import proj21_shoes.dto.Cart;
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

	int updateProductRegDateEmp(Product product);

	int deleteProduct(int code);

	int updateOrderOptionStock(OrderProduct orderProduct);

	int updateCumulativeSellCount(OrderProduct orderProduct);

	List<Brand> brandBySel(String code);

	// 리스트 + 검색 + 페이징
	public List<Product> findAll(SearchCriteria scri) throws Exception;
	
	// 리스트 + 검색 + 페이징 (게시물 총 개수 구하기)
	public int countInfoList(SearchCriteria scri) throws Exception;

	List<Product> productListByCode(List<Cart> cartList);
	
	public int updateProductStock(Product product);
	
	public int updateDelProductStock(Product product);
	
	public int updateModProductStock(Product product);
}
