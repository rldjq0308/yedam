package co.yedam.gamerz.review.mapper;

import java.util.HashMap;
import java.util.List;

import co.yedam.gamerz.review.service.ReviewVO;

public interface ReviewMapper {
	List<HashMap<String, Object>> reviewSelectList();

	ReviewVO reviewSelect(ReviewVO vo);

	int reviewInsert(ReviewVO vo);

	int reviewUpdate(ReviewVO vo);

	int reviewDelete(ReviewVO vo);
}
