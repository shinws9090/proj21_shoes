package proj21_shoes.service;

import java.util.List;

import proj21_shoes.dto.Cart;
import proj21_shoes.dto.Member;

public interface CartService {
	
	List<Cart> cartListByMember(Member member);
	
	int insertCart(Cart cart);
	
	int updateCartCount(Cart cart);
	
	int deleteCart(int cartCode);
	
	Cart cartBycartCode(int cartCode);
	void cartCountUp(int cartCode);
	void cartCountDown(int cartCode);
}
