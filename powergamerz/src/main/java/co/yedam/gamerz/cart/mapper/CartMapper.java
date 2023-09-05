package co.yedam.gamerz.cart.mapper;

import java.util.HashMap;
import java.util.List;

import co.yedam.gamerz.cart.service.CartVO;

public interface CartMapper {
	List<HashMap<String, Object>> cartList();
	
	CartVO cartSelect(CartVO vo);
	
	int cartInsert(CartVO vo);
	
	int cartDelete(CartVO vo);
	
	int cartPayDelete(CartVO vo);
	
	int cartUpdate(CartVO vo);
}
