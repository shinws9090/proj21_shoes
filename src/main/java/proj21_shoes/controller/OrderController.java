package proj21_shoes.controller;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import proj21_shoes.dto.Cart;
import proj21_shoes.dto.Member;
import proj21_shoes.dto.Order;
import proj21_shoes.dto.OrderOption;
import proj21_shoes.dto.OrderProduct;
import proj21_shoes.dto.Product;
import proj21_shoes.service.CartService;
import proj21_shoes.service.ProductService;

@RestController
public class OrderController {
	
	@Autowired
	private CartService cService;
	
	@Autowired
	ProductService pService;
	
	@PostMapping("/order")
	public ModelAndView orderList(@RequestParam(required = false, value = "codeList") List<Integer> codeList) {
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
		Member member = new Member();
		member.setMemberCode(111111);
		
		Order order = new Order();
		order.setMemberCode(member);
		order.setOrderDate(LocalDateTime.now());
		order.setOrderProduct(orderProductList);
		
		
		List<Product> productList = new ArrayList<Product>();
		for(Cart c : cartList) {
			productList.add(pService.productByCode(c.getProductCode()));
		}
		
		ModelAndView mav = new ModelAndView("product/order","order",order);
		mav.addObject("productList",productList);
		return mav;
	}
	@PostMapping("/orderGet")
	public String orderGet(HttpServletRequest request) {
		System.out.println(request.getAttribute("oo"));
		return null;
	}
}
