package proj21_shoes.mapper;

import proj21_shoes.dto.Image;

public interface ImageMapper {
	int insertImage(Image image);

	int updateImage(Image image);

	int deleteImage(Image image);
}
