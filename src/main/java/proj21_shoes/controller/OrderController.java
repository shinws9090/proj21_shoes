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
	@Autowired
	AuthService aService;
	
	@PostMapping("/orderList")
	public ModelAndView orderList(@RequestParam(required = false, value = "codeList") List<Integer> codeList,
				HttpSession session) {
		List<Cart> cartList = cService.cartBycartCodes(codeList);
		List<OrderProduct> orderProductList = new ArrayList<OrderProduct>();
		for(Cart c : cartList) {
			
			OrderOption orderOption = new OrderOption();
			orderOption.setColor(pService.OrderOptionByStyle(c.getStyleCode(), c.getProductCode()).get(0).getColor());
			orderOption.setProductCode(c.getProductCode());
			orderOption.setSize(c.getSize());
			orderOption.setStyleCode(c.getStyleCode());
			
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
		AuthInfoCommend a = (AuthInfoCommend)session.getAttribute("authInfo");
		if(a == null) {
			return new ModelAndView("redirect:/login/loginForm");
		}
		aService.memberVo(a.getMemberId());
		Member member = aService.memberVo(a.getMemberId());
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
		
		AuthInfoCommend a = (AuthInfoCommend)session.getAttribute("authInfo");
		if(a == null) {
			return new ModelAndView("redirect:/login/loginForm");
		}
		aService.memberVo(a.getMemberId());
		Member member = aService.memberVo(a.getMemberId());
		if(member == null) {
			return new ModelAndView("redirect:/login/loginForm");
		}
		
		List<OrderProduct> orderProductList = new ArrayList<OrderProduct>();
		orderOption.setColor(pService.OrderOptionByStyle(orderOption.getStyleCode(), orderOption.getProductCode()).get(0).getColor());
		OrderProduct orderProduct =  new OrderProduct();
		orderProduct.setOrderOption(orderOption);
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
								HttpServletRequest request) {
		Order order = (Order) request.getSession().getAttribute("order");
		if(order==null) {
			return "redirect:cartList";
		}
		order.setAddress(address);
		order.setPaymentAmount(priceSel);
		
		oService.insertOrder(order);
		request.getSession().setAttribute("order",order);
		return "product/orderOK";
	}

}
