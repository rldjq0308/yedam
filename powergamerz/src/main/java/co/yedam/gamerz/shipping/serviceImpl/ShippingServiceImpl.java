package co.yedam.gamerz.shipping.serviceImpl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.yedam.gamerz.common.DataSources;
import co.yedam.gamerz.shipping.mapper.ShippingMapper;
import co.yedam.gamerz.shipping.service.ShippingService;
import co.yedam.gamerz.shipping.service.ShippingVO;

public class ShippingServiceImpl implements ShippingService {
	private SqlSession sqlSession = DataSources.getInstance().openSession(true);
	private ShippingMapper map = sqlSession.getMapper(ShippingMapper.class);
	
	
	@Override
	public List<HashMap<String, Object>> shippingAList() {
		return map.shippingAList();
	}

	@Override
	public List<ShippingVO> shippingList() {
		return map.shippingList();
	}

	@Override
	public ShippingVO shippingSelect(ShippingVO vo) {
		return map.shippingSelect(vo);
	}

	@Override
	public int shippingInsert(ShippingVO vo) {
		return map.shippingInsert(vo);
	}

	@Override
	public int shippingDelete(ShippingVO vo) {
		return map.shippingDelete(vo);
	}

	@Override
	public int shippingUpdate(ShippingVO vo) {
		return map.shippingUpdate(vo);
	}

}
