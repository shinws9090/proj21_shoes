package proj21_shoes.mapper;

import java.util.List;

import proj21_shoes.dto.ReView;

public interface ReviewMapper {
	List<ReView> selectReviewByMemberId(String memberId);
		
	int updateMember(String member);  				//문의내용 수정
	int deleteMember(long id);  
}
