package co.yedam.gamerz.support.faq.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.yedam.gamerz.support.faq.service.FaqVO;

public interface FaqMapper {
	List<FaqVO> faqSelectList();
	List<FaqVO> faqSearchtList(@Param("key") String key, @Param("val") String val);
	FaqVO faqSelect(FaqVO vo);
	int faqInsert(FaqVO vo);
	int faqUpdate(FaqVO vo);
	int faqDelete(FaqVO vo);
	List<FaqVO> faqPaging(@Param("pageNum") int pageNum, @Param("amount") int amount);
	int faqTotalCount();
}
