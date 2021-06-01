package proj21_shoes.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shoes.dto.Brand;
import proj21_shoes.dto.Product;
import proj21_shoes.mapper.ProductMapper;
import proj21_shoes.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	ProductMapper mapper;
	
	@Override
	public List<Product> productByAll() {
		return mapper.productByAll();
	}
	@Override
	public List<Product> productByMenu(String menu){
		return mapper.productByMenu(menu);
	}
	@Override
	public List<Brand> brandByAll() {
		return mapper.BrandByAll();
	}

}
