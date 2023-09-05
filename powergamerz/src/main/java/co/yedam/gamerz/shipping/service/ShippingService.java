package co.yedam.gamerz.shipping.service;

import java.util.HashMap;
import java.util.List;


public interface ShippingService {
	List<HashMap<String, Object>> shippingAList();
	List<ShippingVO> shippingList();
	
	ShippingVO shippingSelect(ShippingVO vo);
	
	int shippingInsert(ShippingVO vo);
	
	int shippingDelete(ShippingVO vo);
	
	int shippingUpdate(ShippingVO vo);
}
