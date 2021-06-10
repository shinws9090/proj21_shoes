package proj21_shoes.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shoes.dto.Cart;
import proj21_shoes.dto.Member;
import proj21_shoes.mapper.CartMapper;
import proj21_shoes.service.CartService;

@Service
public class CartServiceImpl implements CartService{

	@Autowired
	private CartMapper mapper;
	
	@Override
	public List<Cart> cartListByMember(Member member) {
		return mapper.cartListByMember(member);
	}

	@Override
	public int insertCart(Cart cart) {
		Cart chackCart = mapper.cartByOne(cart);
		if(chackCart != null) {
			chackCart.setCount(chackCart.getCount()+cart.getCount());
			return mapper.updateCartCount(chackCart);
		}
		
		return mapper.insertCart(cart);
	}

	@Override
	public int updateCartCount(Cart cart) {
		return mapper.updateCartCount(cart);
	}

	@Override
	public int deleteCart(int cartCode) {
		return mapper.deleteCart(cartCode);
	}

	
	@Override
	public void cartCountUp(int cartCode) {
		mapper.cartCountUp(cartCode);
	}

	@Override
	public void cartCountDown(int cartCode) {
		mapper.cartCountDown(cartCode);
	}

	@Override
	public Cart cartBycartCode(int cartCode) {
		return mapper.cartBycartCode(cartCode);
	}

	@Override
	public List<Cart> cartBycartCodes(List<Integer> cartCodes) {
		return mapper.cartBycartCodes(cartCodes);
	}
	

}
