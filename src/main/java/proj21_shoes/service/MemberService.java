package proj21_shoes.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_shoes.commend.SearchCriteria;
import proj21_shoes.dto.Member;

@Service
public interface MemberService {
	// 리스트 + 검색 + 페이징
	public List<Member> findAll(SearchCriteria scri) throws Exception;

	// 리스트 + 검색 + 페이징 (게시물 총 개수 구하기)
	public int countInfoList(SearchCriteria scri) throws Exception;
}
