package proj21_shoes.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shoes.dto.Image;
import proj21_shoes.mapper.ImageMapper;
import proj21_shoes.service.ImageService;

@Service
public class ImageServiceImpl implements ImageService {

	@Autowired
	ImageMapper mapper;

	@Override
	public int insertImage(Image image) {
		return mapper.insertImage(image);
	}

	@Override
	public int updateImage(Image image) {
		return mapper.updateImage(image);
	}

	@Override
	public int deleteImage(Image image) {
		return mapper.deleteImage(image);
	}

}
