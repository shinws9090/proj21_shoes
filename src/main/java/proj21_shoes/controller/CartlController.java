package proj21_shoes.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import proj21_shoes.dto.Cart;
import proj21_shoes.dto.Member;
import proj21_shoes.dto.Product;
import proj21_shoes.service.CartService;
import proj21_shoes.service.ProductService;

@RestController
public class CartlController {

	@Autowired
	CartService service;
	
	@Autowired
	ProductService pService;

	@GetMapping("/cartList")
	public ModelAndView cartList() {
		//테스트용
		Member member = new Member();
		member.setMemberCode(111111);
		
		List<Cart> cartList = service.cartListByMember(member);
		List<Product> productList = new ArrayList<Product>();
		for(Cart c : cartList) {
			productList.add(pService.productByCode(c.getProductCode()));
		}
		ModelAndView mav = new ModelAndView("product/cartList");
		mav.addObject("cartList",cartList);
		mav.addObject("productList",productList);
		return mav;
	}
	
	
	@PutMapping("api/countUp/{cartCode}")
	public ResponseEntity<Object> countUp(@PathVariable int cartCode) {
		service.cartCountUp(cartCode);
		return ResponseEntity.ok(service.cartBycartCode(cartCode));
	}
	
	
	@PutMapping("api/countDown/{cartCode}")
	public ResponseEntity<Object> countDown(@PathVariable int cartCode) {
		service.cartCountDown(cartCode);
		return ResponseEntity.ok(service.cartBycartCode(cartCode));
	}
	
	
	@DeleteMapping("api/delete/{cartCode}")
	public ResponseEntity<Object> cartDelete(@PathVariable int cartCode) {
		int res = service.deleteCart(cartCode);
		if(res == 0) {
			return ResponseEntity.notFound().build();
		}
		return ResponseEntity.ok("");
		
	}
		
	@PostMapping("api/cartSave")
	public ResponseEntity<Object> cartSave(@RequestBody Cart cart, HttpServletRequest request) {
		if(cart.getProductCode()<=0||cart.getSize()<=0||cart.getStyleCode()<=0||cart.getCount()<=0) {
			return ResponseEntity.badRequest().build();
		}
//		Member member = (Member) request.getSession().getAttribute("member");
//		if(member != null) {
//			return ResponseEntity.notFound().build();
//		}
//		cart.setMember(member);
		//테스트용
		Member member = new Member();
		member.setMemberCode(111111);
		
		cart.setMember(member);
		System.out.println(cart);
		int res = service.insertCart(cart);
		if(res==1) {
			return ResponseEntity.ok(cart);
		}
		return null;
	}
}
