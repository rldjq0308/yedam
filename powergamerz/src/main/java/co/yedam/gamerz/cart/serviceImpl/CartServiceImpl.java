package co.yedam.gamerz.cart.serviceImpl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.yedam.gamerz.cart.mapper.CartMapper;
import co.yedam.gamerz.cart.service.CartService;
import co.yedam.gamerz.cart.service.CartVO;
import co.yedam.gamerz.common.DataSources;

public class CartServiceImpl implements CartService {
	private SqlSession sqlSession = DataSources.getInstance().openSession(true);
	private CartMapper map = sqlSession.getMapper(CartMapper.class);
	
	@Override
	public List<HashMap<String, Object>> cartList() {
		return map.cartList();
	}

	@Override
	public CartVO cartSelect(CartVO vo) {
		return map.cartSelect(vo);
	}

	@Override
	public int cartInsert(CartVO vo) {
		return map.cartInsert(vo);
	}

	@Override
	public int cartDelete(CartVO vo) {
		return map.cartDelete(vo);
	}
	
	@Override
	public int cartPayDelete(CartVO vo) {
		return map.cartPayDelete(vo);
	}

	@Override
	public int cartUpdate(CartVO vo) {
		return map.cartUpdate(vo);
	}

}
