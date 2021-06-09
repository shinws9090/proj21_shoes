package proj21_shoes.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shoes.commend.ProductSelectCommend;
import proj21_shoes.dto.Brand;
import proj21_shoes.dto.OrderOption;
import proj21_shoes.dto.Product;
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
		product.setOrderOptions(OrderOptionByCode(code));
		return product;
	}

	@Override
	public List<OrderOption> OrderOptionByCode(int code) {
		return mapper.OrderOptionByCode(code);
	}

	@Override
	public List<Product> productByBrand(int code) {
		return mapper.productByBrand(code);
	}

	@Override
	public List<Product> productBycommand(ProductSelectCommend productSelectCommend) {
		return mapper.productBycommand(productSelectCommend);
	}

	@Override
	public int insertProduct(Product product) {
		return mapper.insertProduct(product);
	}

	@Override
	public int updateProduct(Product product) {
		return mapper.updateProduct(product);
	}

	@Override
	public int deleteProduct(Product product) {
		return mapper.deleteProduct(product);
	}

	@Override
	public List<OrderOption> OrderOptionByStyle(int styleCode, int code) {
		return mapper.OrderOptionByStyle(styleCode, code);
	}

}
