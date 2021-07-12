package proj21_shoes.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shoes.commend.ModifyMyBuyConfirmCommend;
import proj21_shoes.commend.MyOrderCommend;
import proj21_shoes.commend.Pagination;
import proj21_shoes.commend.SearchCriteria;
import proj21_shoes.mapper.MyOrderMapper;
import proj21_shoes.service.MyOrderService;
@Service
public class MyOrderServiceImpl implements MyOrderService {
	@Autowired
	MyOrderMapper mapper;
	
	
	@Override
	public 	List<MyOrderCommend> selectMyOrderById(String memberid) {
		return mapper.selectMyOrderById(memberid);
	}


	@Override
	public MyOrderCommend selectMyOrderByOrderCode(int orderCode) {
		
		return mapper.selectMyOrderByOrderCode(orderCode);
	}


	@Override
	public List<Map<String, Object>> selectMyOrderListById(String memberId, Pagination pagination) throws Exception {
		return mapper.selectMyOrderListById(memberId, pagination.getPageSearch(), pagination.getCntPerPage());
	}


	@Override
	public int MyOrderCount(String memberId) throws Exception {
		 return mapper.MyOrderCount(memberId);
	}


	@Override
	public int updateMyBuyConfirm(int orderCode) {
		return mapper.updateMyBuyConfirm(orderCode);
	}


	@Override
	public int updateMyCancel(int orderCode) {
		return mapper.updateMyCancel(orderCode);
	}


	@Override
	public List<Map<String, Object>> selectMyCancelOrderListById(String memberId, Pagination pagination)
			throws Exception {
		return mapper.selectMyCancelOrderListById(memberId, pagination.getPageSearch(), pagination.getCntPerPage());
	}


	@Override
	public int MyCancelOrderCount(String memberId) throws Exception {
		return mapper.MyCancelOrderCount(memberId);
	}


	@Override
	public List<MyOrderCommend> findAll(SearchCriteria scri) throws Exception {
		return mapper.findAll(scri);
	}


	@Override
	public int countInfoList(SearchCriteria scri) throws Exception {
		return mapper.countInfoList(scri);
	}


	@Override
	public int countPaymentState(int paymentState) {
		return mapper.countPaymentState(paymentState);
	}

}
