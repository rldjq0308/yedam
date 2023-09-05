package co.yedam.gamerz.shipping.mapper;

import java.util.HashMap;
import java.util.List;

import co.yedam.gamerz.shipping.service.ShippingVO;

public interface ShippingMapper {
	List<HashMap<String, Object>> shippingAList();
	List<ShippingVO> shippingList();
	
	ShippingVO shippingSelect(ShippingVO vo);
	
	int shippingInsert(ShippingVO vo);
	
	int shippingDelete(ShippingVO vo);
	
	int shippingUpdate(ShippingVO vo);
}
