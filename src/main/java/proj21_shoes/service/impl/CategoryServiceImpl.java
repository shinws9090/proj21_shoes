package proj21_shoes.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shoes.dto.Category;
import proj21_shoes.mapper.CategoryMapper;
import proj21_shoes.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService{
	
	@Autowired
	private CategoryMapper mapper;
	
	@Override
	public List<Category> categoryList() {
		return mapper.categoryList();
	}

	@Override
	public int insertCategory(Category category) {
		// TODO Auto-generated method stub
		return mapper.insertCategory(category);
	}

	@Override
	public int updateCategory(Category category) {
		// TODO Auto-generated method stub
		return mapper.updateCategory(category);
	}

	@Override
	public int deleteCategory(int code) {
		// TODO Auto-generated method stub
		return mapper.deleteCategory(code);
	}

	@Override
	public Category CategoryByCode(int code) {
		return mapper.CategoryByCode(code);
	}
	
}
