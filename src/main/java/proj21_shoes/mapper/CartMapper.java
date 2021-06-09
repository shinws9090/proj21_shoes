package proj21_shoes.mapper;

import java.util.List;

import proj21_shoes.dto.Cart;
import proj21_shoes.dto.Member;

public interface CartMapper {
	
	List<Cart> cartListByMember(Member member);
	
	Cart cartByOne(Cart cart);
	
	int insertCart(Cart cart);
	
	int updateCartCount(Cart cart);
	
	int deleteCart(int cartCode);
}
