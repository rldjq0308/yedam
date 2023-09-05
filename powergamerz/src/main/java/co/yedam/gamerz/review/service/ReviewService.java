package co.yedam.gamerz.review.service;

import java.util.HashMap;
import java.util.List;

public interface ReviewService {
	List<HashMap<String, Object>> reviewSelectList();
	
	ReviewVO reviewSelect(ReviewVO vo);
	
	int reviewInsert(ReviewVO vo);
	
	int reviewUpdate(ReviewVO vo);
	
	int reviewDelete(ReviewVO vo);
}
