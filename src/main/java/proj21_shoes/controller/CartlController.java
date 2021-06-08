package proj21_shoes.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import proj21_shoes.dto.Cart;
import proj21_shoes.service.ProductService;

@RestController
public class CartlController {

	@Autowired
	ProductService service;

	@PostMapping("api/cartSave")
	public ResponseEntity<Object> cartSave(@RequestBody Cart cart, HttpServletRequest request) {
		if(cart.getSize()<=0||cart.getStyleCode()<=0||cart.getCount()<=0) {
			return ResponseEntity.badRequest().build();
		}
		List<Cart> cartList = (List<Cart>) request.getSession().getAttribute("cartList");
		if (cartList == null) {
			cartList = new ArrayList<Cart>();
			request.getSession().setAttribute("cartList", cartList);
		}

		boolean isNewCart = true;
		for (Cart c : cartList) {
			if (cart.equals(c)) {
				isNewCart = false;
				c.setCount(c.getCount() + cart.getCount());
				break;
			}
		}

		if (isNewCart) {
			cartList.add(cart);
		}
		System.out.println(request.getSession().getAttribute("cartList"));
		
		return ResponseEntity.ok(cart);
	}
}
