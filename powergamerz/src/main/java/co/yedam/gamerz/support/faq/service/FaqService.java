package co.yedam.gamerz.support.faq.service;

import java.util.List;

public interface FaqService {
	List<FaqVO> faqSelectList();
	List<FaqVO> faqSearchtList(String key,String val);
	FaqVO faqSelect(FaqVO vo);
	int faqInsert(FaqVO vo);
	int faqUpdate(FaqVO vo);
	int faqDelete(FaqVO vo);
	List<FaqVO> faqPaging(int pageNum, int amount);
	int faqTotalCount();
}
