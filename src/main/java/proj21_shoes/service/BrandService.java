package proj21_shoes.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_shoes.dto.Brand;

@Service
public interface BrandService {
	public List<Brand> brandList();
	
	public Brand brandByCode(int code);

	int insertBrand(Brand brand);

	int updateBrand(Brand brand);

	int deleteBrand(int code);
}
