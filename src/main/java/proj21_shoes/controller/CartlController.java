package proj21_shoes.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

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

import proj21_shoes.commend.AuthInfoCommend;
import proj21_shoes.dto.Cart;
import proj21_shoes.dto.Member;
import proj21_shoes.dto.Product;
import proj21_shoes.service.AuthService;
import proj21_shoes.service.CartService;
import proj21_shoes.service.ProductService;

@RestController
public class CartlController {

	@Autowired
	CartService service;
	
	@Autowired
	ProductService pService;
	
	@Autowired
	AuthService aService;

	@GetMapping("/cartList")
	public ModelAndView cartList(HttpSession session) {
		//테스트용
//		Member member = new Member();
//		member.setMemberCode(111111);
		AuthInfoCommend a = (AuthInfoCommend)session.getAttribute("authInfo");
		if(a == null) {
			return new ModelAndView("redirect:/login/loginForm");
		}
		aService.memberVo(a.getMemberId());
		Member member = aService.memberVo(a.getMemberId());
		if(member == null) {
			return new ModelAndView("redirect:/login/loginForm");
		}
		
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
	public ResponseEntity<Object> cartSave(@RequestBody Cart cart, HttpSession session) {
		if(cart.getProductCode()<=0||cart.getSize()<=0||cart.getStyleCode()<=0||cart.getCount()<=0) {
			return ResponseEntity.badRequest().build();
		}
		AuthInfoCommend a = (AuthInfoCommend)session.getAttribute("authInfo");
		if(a == null) {
			return ResponseEntity.notFound().build();
		}
		aService.memberVo(a.getMemberId());
		Member member = aService.memberVo(a.getMemberId());
		if(member == null) {
			return ResponseEntity.notFound().build();
		}
		cart.setMember(member);
		//테스트용
//		Member member = new Member();
//		member.setMemberCode(111111);
//		cart.setMember(member);
		
		System.out.println(cart);
		int res = service.insertCart(cart);
		if(res==1) {
			return ResponseEntity.ok(cart);
		}
		return null;
	}
}
