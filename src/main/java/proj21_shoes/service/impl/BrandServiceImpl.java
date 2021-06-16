package proj21_shoes.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shoes.dto.Brand;
import proj21_shoes.mapper.BrandMapper;
import proj21_shoes.service.BrandService;

@Service
public class BrandServiceImpl implements BrandService {

	@Autowired
	private BrandMapper mapper;
	
	@Override
	public List<Brand> brandList() {
		// TODO Auto-generated method stub
		return mapper.brandList();
	}

}
