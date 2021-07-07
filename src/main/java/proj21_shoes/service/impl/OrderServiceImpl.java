package proj21_shoes.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import proj21_shoes.commend.OrderCommend;
import proj21_shoes.dto.Member;
import proj21_shoes.dto.Order;
import proj21_shoes.dto.OrderProduct;
import proj21_shoes.mapper.CartMapper;
import proj21_shoes.mapper.OrderMapper;
import proj21_shoes.mapper.ProductMapper;
import proj21_shoes.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper mapper;
	@Autowired
	private ProductMapper pMapper;
	@Autowired
	private CartMapper cMapper;

	@Transactional
	@Override
	public int insertOrder(Order order, List<Integer> codeList, int point) {
		int res = 0;
		res += mapper.insertOrder(order);
		res += mapper.insertOrderProduct(order);
		res += mapper.insertAddress(order);

		// 제고 - 주문수량 연산 업데이트
		for (OrderProduct o : order.getOrderProduct()) {
			pMapper.updateOrderOptionStock(o);
			pMapper.updateCumulativeSellCount(o);
		}
		if (codeList != null) { 
			for (Integer i : codeList) {
				cMapper.deleteCart(i);
			}
		}
		Member member = order.getMemberCode();
		member.setPoint((int) (member.getPoint()-point+(order.getPaymentAmount()*0.01)));
		
		member.setCumulativeBuyAmount(member.getCumulativeBuyAmount()+order.getPaymentAmount());
		
		mapper.updateMemberPoint(member);
		
		return res;
	}

	@Override
	public List<OrderCommend> orderListByMonthPay() {
		return mapper.orderListByMonthPay();
	}

}
