package proj21_shoes.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import proj21_shoes.commend.ModifyMyBuyConfirmCommend;
import proj21_shoes.commend.MyOrderCommend;
import proj21_shoes.commend.SearchCriteria;

@Component
public interface MyOrderMapper {
	//페이징전. 이제안씀//
	List<MyOrderCommend> selectMyOrderById(String memberId);					//회원id로 검색
	/////////////////////////////
	
	 List<Map<String, Object>> selectMyOrderListById (
			 @Param("memberId") String memberId, @Param("pageSearch") int pageSearch, @Param("cntPerPage") int cntPerPage);
	
	 int MyOrderCount(String memberId);
	
	
	
	
	////////////
	int updateMyBuyConfirm(int orderCode);
	MyOrderCommend selectMyOrderByOrderCode(int orderCode);					//주문코드로 검색
	///주문취소
	int updateMyCancel(int orderCode);  //주문취소버튼 클릭시 작동시킬거
	

	//주문취소내역

	 List<Map<String, Object>> selectMyCancelOrderListById (
			 @Param("memberId") String memberId, @Param("pageSearch") int pageSearch, @Param("cntPerPage") int cntPerPage);
	
	 int MyCancelOrderCount(String memberId);
	
	
	// 리스트 + 검색 + 페이징
	public List<MyOrderCommend> findAll(SearchCriteria scri) throws Exception;

	// 리스트 + 검색 + 페이징 (게시물 총 개수 구하기)
	public int countInfoList(SearchCriteria scri) throws Exception;
	
	public int countPaymentState(int paymentState);
	
	public int updatePaymentState(MyOrderCommend order);
	
	public int updateDeliverState(MyOrderCommend order);
	
	public int countCancelState(int cancelState);
	
}
