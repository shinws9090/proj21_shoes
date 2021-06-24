package proj21_shoes.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_shoes.commend.MyQnaViewCommand;
import proj21_shoes.dto.Qna;
import proj21_shoes.dto.ReView;
@Service
public interface ProductReviewService {
	

	List<ReView> selectProductReviewbyCode(int productCode,int page);

	ReView selectReviewbyBoardCode(int boardCode);					

	int productReviewInsert(ReView reView);

	int productReviewDelete(int boardCode);

	int productReviewUpdate(ReView reView);

	int selectProductReviewCount(int code);



	
}
