package proj21_shoes.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shoes.commend.ProductSelectCommend;
import proj21_shoes.commend.SearchCriteria;
import proj21_shoes.dto.Brand;
import proj21_shoes.dto.Cart;
import proj21_shoes.dto.OrderOption;
import proj21_shoes.dto.Product;
import proj21_shoes.exeption.DuplicateProductException;
import proj21_shoes.mapper.ProductMapper;
import proj21_shoes.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductMapper mapper;

	@Override
	public List<Product> productByAll() {
		return mapper.productByAll();
	}

	@Override
	public List<Product> productByMenu(String menu) {
		return mapper.productByMenu(menu);
	}

	@Override
	public List<Brand> brandByAll() {
		return mapper.BrandByAll();
	}

	@Override
	public Product productByCode(int code) {
		Product product = mapper.productByCode(code);
		product.setOrderOptions(OrderOptionBy1(code));
		return product;
	}

	@Override
	public List<Product> productByBrand(int code) {
		return mapper.productByBrand(code);
	}

	@Override
	public List<Product> productBycommand(ProductSelectCommend productSelectCommend) {
		List<Product> products = mapper.productBycommand(productSelectCommend);
		for (Product p : products) {
			p.setOrderOptions(OrderOptionBy1(p.getProductCode()));
		}
		return products;
	}

	@Override
	public int insertProduct(Product product) {
		Product productNo = mapper.productByCode(product.getProductCode());

		if (productNo != null) {
			throw new DuplicateProductException("DuplicateProduct" + productNo);
		}

		return mapper.insertProduct(product);
	}

	@Override
	public int updateProduct(Product product) {
		return mapper.updateProduct(product);
	}
	
	@Override
	public int updateProductRegDateEmp(Product product) {
		return mapper.updateProductRegDateEmp(product);
	}

	@Override
	public int deleteProduct(int code) {
		return mapper.deleteProduct(code);
	}

	@Override
	public List<OrderOption> OrderOptionBy1(int code) {
		return mapper.OrderOptionByCode(code);
	}

	@Override
	public List<OrderOption> OrderOptionBy2(int styleCode, int code) {
		return mapper.OrderOptionByStyle(styleCode, code);
	}

	@Override
	public OrderOption OrderOptionBy3(int styleCode, int code, int size) {
		return mapper.OrderOptionBy3(styleCode, code, size);
	}

	@Override
	public List<Brand> brandBySel(String code) {
		return mapper.brandBySel(code);
	}

	@Override
	public List<Product> findAll(SearchCriteria scri) throws Exception {
		return mapper.findAll(scri);
	}

	@Override
	public int countInfoList(SearchCriteria scri) throws Exception {
		return mapper.countInfoList(scri);
	}

	@Override
	public List<Product> productListByCode(List<Cart> cartList) {
		List<Product> product = mapper.productListByCode(cartList);
		for(Product item : product) {
			item.setOrderOptions(OrderOptionBy1(item.getProductCode()));
		}
		return product;
	}

	@Override
	public int updateProductStock(Product product) {
		return mapper.updateProductStock(product);
	}

	@Override
	public int updateDelProductStock(Product product) {
		return mapper.updateDelProductStock(product);
	}

	@Override
	public int updateModProductStock(Product product) {
		return mapper.updateModProductStock(product);
	}

}
