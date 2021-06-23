package proj21_shoes.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shoes.dto.ProductPost;
import proj21_shoes.mapper.ProductPostMapper;
import proj21_shoes.service.ProductPostService;

@Service
public class ProductPostServiceImpl implements ProductPostService {

	@Autowired
	ProductPostMapper mapper;

	@Override
	public List<ProductPost> productPostByAll() {
		return mapper.productPostByAll();
	}

	@Override
	public int insertProductPost(ProductPost productPost) {
		return mapper.insertProductPost(productPost);
	}

	@Override
	public int updateProductPost(ProductPost productPost) {
		return mapper.updateProductPost(productPost);
	}

	@Override
	public int deleteProductPost(ProductPost productPost) {
		return mapper.deleteProductPost(productPost);
	}

	@Override
	public int updateProductPostContent(ProductPost productPost) {
		return mapper.updateProductPostContent(productPost);
	}

	@Override
	public int updateProductPostImage(ProductPost productPost) {
		return mapper.updateProductPostImage(productPost);
	}

}
