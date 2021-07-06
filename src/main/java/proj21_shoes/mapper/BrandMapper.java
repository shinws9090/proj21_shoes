package proj21_shoes.mapper;

import java.util.List;

import proj21_shoes.dto.Brand;

public interface BrandMapper {
	public List<Brand> brandList();
	
	public Brand brandByCode(int code);

	int insertBrand(Brand brand);

	int updateBrand(Brand brand);

	int deleteBrand(int code);
}
