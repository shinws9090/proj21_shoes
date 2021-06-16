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
	
}
