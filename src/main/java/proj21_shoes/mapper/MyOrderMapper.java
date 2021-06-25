package proj21_shoes.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import proj21_shoes.commend.MyOrderCommend;

@Component
public interface MyOrderMapper {
	//페이징전. 이제안씀//
	List<MyOrderCommend> selectMyOrderById(String memberId);					//회원id로 검색
	/////////////////////////////
	
	 List<Map<String, Object>> selectMyOrderListById (
			 @Param("memberId") String memberId, @Param("pageSearch") int pageSearch, @Param("cntPerPage") int cntPerPage);
	
	 int MyOrderCount(String memberId);
	
	
	
	
	
	
	MyOrderCommend selectMyOrderByOrderCode(int orderCode);					//주문코드로 검색

	
	
}
