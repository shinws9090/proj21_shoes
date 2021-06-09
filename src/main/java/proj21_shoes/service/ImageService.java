package proj21_shoes.service;

import org.springframework.stereotype.Service;

import proj21_shoes.dto.Image;

@Service
public interface ImageService {

	int insertImage(Image image);

	int updateImage(Image image);

	int deleteImage(Image image);
}
