package proj21_shoes.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_shoes.dto.Category;

@Service
public interface CategoryService {
	public List<Category> categoryList();

	int insertCategory(Category category);

	int updateCategory(Category category);

	int deleteCategory(int code);
}
