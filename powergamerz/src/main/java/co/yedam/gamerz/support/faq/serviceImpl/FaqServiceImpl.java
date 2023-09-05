package co.yedam.gamerz.support.faq.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.yedam.gamerz.common.DataSources;
import co.yedam.gamerz.support.faq.mapper.FaqMapper;
import co.yedam.gamerz.support.faq.service.FaqService;
import co.yedam.gamerz.support.faq.service.FaqVO;

public class FaqServiceImpl implements FaqService {
	private SqlSession sqlSession = DataSources.getInstance().openSession(true);
	private FaqMapper map = sqlSession.getMapper(FaqMapper.class);
	
	@Override
	public List<FaqVO> faqSelectList() {
		// TODO Auto-generated method stub
		return map.faqSelectList();
	}

	@Override
	public List<FaqVO> faqSearchtList(String key, String val) {
		// TODO Auto-generated method stub
		return map.faqSearchtList(key, val);
	}

	@Override
	public FaqVO faqSelect(FaqVO vo) {
		// TODO Auto-generated method stub
		return map.faqSelect(vo);
	}

	@Override
	public int faqInsert(FaqVO vo) {
		// TODO Auto-generated method stub
		return map.faqInsert(vo);
	}

	@Override
	public int faqUpdate(FaqVO vo) {
		// TODO Auto-generated method stub
		return map.faqUpdate(vo);
	}

	@Override
	public int faqDelete(FaqVO vo) {
		// TODO Auto-generated method stub
		return map.faqDelete(vo);
	}

	@Override
	public List<FaqVO> faqPaging(int pageNum, int amount) {
		// TODO Auto-generated method stub
		return map.faqPaging(pageNum, amount);
	}

	@Override
	public int faqTotalCount() {
		// TODO Auto-generated method stub
		return map.faqTotalCount();
	}

}
