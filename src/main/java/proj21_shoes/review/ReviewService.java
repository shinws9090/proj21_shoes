package proj21_shoes.review;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import proj21_shoes.dto.ReView;

@Service
public interface ReviewService {

	int getListCount();

	ArrayList<ReView> getArticleList(int page, int limit);

	List<ReView> selectReviewByProductCode(String productCode);
	
}
