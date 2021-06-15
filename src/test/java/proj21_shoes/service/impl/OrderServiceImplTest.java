package proj21_shoes.service.impl;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import proj21_shoes.config.ContextRoot;
import proj21_shoes.dto.Address;
import proj21_shoes.dto.Member;
import proj21_shoes.dto.Order;
import proj21_shoes.dto.OrderOption;
import proj21_shoes.dto.OrderProduct;
import proj21_shoes.service.OrderService;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@WebAppConfiguration
public class OrderServiceImplTest {
	
	private static final Log log = LogFactory.getLog(OrderServiceImplTest.class);

	@Autowired
	OrderService service;
	
	@Test
	public void testInsertOrder() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		Order order = new Order();
		order.setMemberCode(new Member(111111));
		order.setOrderDate(LocalDateTime.now());
		order.setPaymentAmount(10000);
		List<OrderProduct> orderProduct = new ArrayList<OrderProduct>();
		OrderProduct o1 = new OrderProduct();
		o1.setOrderCount(10);
		o1.setOrderOption(new OrderOption(11111, 1, 270));
		OrderProduct o2 = new OrderProduct();
		o2.setOrderCount(10);
		o2.setOrderOption(new OrderOption(22222, 2, 280));
		OrderProduct o3 = new OrderProduct();
		o3.setOrderCount(10);
		o3.setOrderOption(new OrderOption(33333, 3, 230));
		orderProduct.add(o1);
		orderProduct.add(o2);
		orderProduct.add(o3);
		
		order.setOrderProduct(orderProduct);
		Address address = new Address();
		address.setAddress("asdasd");
		address.setDetailAddress("asdasd");
		address.setRecipient("asdasd");
		address.setTel("asdasd");
		address.setZipCode("asdas");
		
		order.setAddress(address);
		service.insertOrder(order,null,0);
		
	}

}
