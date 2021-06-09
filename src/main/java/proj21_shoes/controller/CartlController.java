package proj21_shoes.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import proj21_shoes.dto.Cart;
import proj21_shoes.dto.Member;
import proj21_shoes.service.CartService;

@RestController
public class CartlController {

	@Autowired
	CartService service;

	@PostMapping("api/cartSave")
	public ResponseEntity<Object> cartSave(@RequestBody Cart cart, HttpServletRequest request) {
		if(cart.getProductCode()<=0||cart.getSize()<=0||cart.getStyleCode()<=0||cart.getCount()<=0) {
			return ResponseEntity.badRequest().build();
		}
		Member member = (Member) request.getSession().getAttribute("member");
		if(member != null) {
			return ResponseEntity.notFound().build();
		}
		cart.setMember(member);
		service.insertCart(cart);
		return ResponseEntity.ok(cart);
	}
}
