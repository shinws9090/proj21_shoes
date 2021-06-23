package proj21_shoes.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_shoes.dto.ProductPost;

@Service
public interface ProductPostService {
	List<ProductPost> productPostByAll();

	int insertProductPost(ProductPost productPost);

	int updateProductPost(ProductPost productPost);

	int updateProductPostContent(ProductPost productPost);

	int updateProductPostImage(ProductPost productPost);

	int deleteProductPost(ProductPost productPost);
}
