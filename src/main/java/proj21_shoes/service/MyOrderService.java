package proj21_shoes.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import proj21_shoes.commend.MyOrderCommend;
import proj21_shoes.commend.Pagination;

@Service
public interface MyOrderService {
	
	////ㅍ페이징전이라 안쓴당
	List<MyOrderCommend> selectMyOrderById(String memberid);					//회원id로 검색
	///
	
	
	//페이징
	List<Map<String, Object>> selectMyOrderListById (String memberId, Pagination pagination) throws Exception;
		
	int MyOrderCount(String memberId) throws Exception;
	
	
	
	
	MyOrderCommend selectMyOrderByOrderCode(int orderCode);					//주문코드로 검색

}
