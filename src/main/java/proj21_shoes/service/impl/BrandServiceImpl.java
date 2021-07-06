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
		return mapper.brandList();
	}

	@Override
	public int insertBrand(Brand brand) {
		return mapper.insertBrand(brand);
	}

	@Override
	public int updateBrand(Brand brand) {
		return mapper.updateBrand(brand);
	}

	@Override
	public int deleteBrand(int code) {
		return mapper.deleteBrand(code);
	}

	@Override
	public Brand brandByCode(int code) {
		return mapper.brandByCode(code);
	}

}
