package proj21_shoes.mapper;

import java.util.List;

import proj21_shoes.dto.Category;

public interface CategoryMapper {
	public List<Category> categoryList();
	
	public Category CategoryByCode(int code);

	int insertCategory(Category category);

	int updateCategory(Category category);

	int deleteCategory(int code);
}
