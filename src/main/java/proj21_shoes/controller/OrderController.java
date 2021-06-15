package proj21_shoes.controller;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import proj21_shoes.commend.AuthInfoCommend;
import proj21_shoes.dto.Address;
import proj21_shoes.dto.Cart;
import proj21_shoes.dto.Member;
import proj21_shoes.dto.Order;
import proj21_shoes.dto.OrderOption;
import proj21_shoes.dto.OrderProduct;
import proj21_shoes.dto.Product;
import proj21_shoes.service.AuthService;
import proj21_shoes.service.CartService;
import proj21_shoes.service.OrderService;
import proj21_shoes.service.ProductService;

@Controller
public class OrderController {
	
	@Autowired
	private CartService cService;
	@Autowired
	private OrderService oService;
	@Autowired
	private ProductService pService;
	
	private List<Integer> codeList;
	
	
	@PostMapping("/orderList")
	public ModelAndView orderList(@RequestParam(required = false, value = "codeList") List<Integer> codeList,
				HttpSession session) {
		this.codeList = codeList;
		List<Cart> cartList = cService.cartBycartCodes(codeList);
		List<OrderProduct> orderProductList = new ArrayList<OrderProduct>();
		for(Cart c : cartList) {
			
			OrderOption orderOption = pService.OrderOptionBy3(c.getStyleCode(), c.getProductCode(),c.getSize());
			
			OrderProduct orderProduct =  new OrderProduct();
			orderProduct.setOrderOption(orderOption);
			orderProduct.setOrderCount(c.getCount());
			
			orderProductList.add(orderProduct);
			
		}
		
		//테스트용
//		Member member = new Member();
//		member.setMemberCode(111111);
//		MemberDetail a = new MemberDetail();
//		a.setMemberName("신우섭");
//		a.setAddress("흠");
//		a.setZipCode("흠ㅇ");
//		a.setDetailAddress("흠ㅁ");
//		a.setTel("1234");
//		member.setMemberId(a);
//		member.setPoint(1000);
		Member member = (Member) session.getAttribute("member");
		if(member == null) {
			return new ModelAndView("redirect:/login/loginForm");
		}
		
		
		Order order = new Order();
		order.setMemberCode(member);
		order.setOrderDate(LocalDateTime.now());
		order.setOrderProduct(orderProductList);
		
		
		List<Product> productList = new ArrayList<Product>();
		for(Cart c : cartList) {
			productList.add(pService.productByCode(c.getProductCode()));
		}
		ModelAndView mav = new ModelAndView("product/orderList","productList",productList);
		session.setAttribute("order",order);
		return mav;
	}
	
	@PostMapping("/addOrderOne")
	public ModelAndView addOrderOne(OrderOption orderOption,
				@RequestParam(value = "count") int count,
								HttpSession session) {
		
		Member member = (Member) session.getAttribute("member");
		if(member == null) {
			return new ModelAndView("redirect:/login/loginForm");
		}
		
		List<OrderProduct> orderProductList = new ArrayList<OrderProduct>();
		OrderOption o = pService.OrderOptionBy3(orderOption.getStyleCode(), orderOption.getProductCode(),orderOption.getSize());
		OrderProduct orderProduct =  new OrderProduct();
		orderProduct.setOrderOption(o);
		orderProduct.setOrderCount(count);
		
		orderProductList.add(orderProduct);
		
		
		Order order = new Order();
		order.setMemberCode(member);
		order.setOrderDate(LocalDateTime.now());
		order.setOrderProduct(orderProductList);
		
		List<Product> productList = new ArrayList<Product>();
		productList.add(pService.productByCode(order.getOrderProduct().get(0).getOrderOption().getProductCode()));
		
		ModelAndView mav = new ModelAndView("product/orderList","productList",productList);
		session.setAttribute("order",order);
		return mav;
	}
	
	
	
	@PostMapping("/addOrder")
	public String addOrder(@ModelAttribute Address address,
							@RequestParam(value = "priceSel") int priceSel, 
							@RequestParam(value = "point") int point, 
								HttpSession session) {
		Order order = (Order) session.getAttribute("order");
		if(order==null) {
			return "redirect:cartList";
		}
		order.setAddress(address);
		order.setPaymentAmount(priceSel);
		
		oService.insertOrder(order,codeList,point);
		session.setAttribute("order",order);
		return "product/orderOK";
	}

}
