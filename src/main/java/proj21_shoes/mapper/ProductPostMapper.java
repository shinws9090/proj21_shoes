package proj21_shoes.mapper;

import java.util.List;

import proj21_shoes.dto.ProductPost;

public interface ProductPostMapper {
	List<ProductPost> productPostByAll();

	int insertProductPost(ProductPost productPost);

	int updateProductPost(ProductPost productPost);
	
	int updateProductPostContent(ProductPost productPost);
	
	int updateProductPostImage(ProductPost productPost);

	int deleteProductPost(ProductPost productPost);
}
