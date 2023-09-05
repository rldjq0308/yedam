package co.yedam.gamerz.support.qna.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.yedam.gamerz.common.DataSources;
import co.yedam.gamerz.support.qna.Mapper.QnaMapper;
import co.yedam.gamerz.support.qna.service.QnaService;
import co.yedam.gamerz.support.qna.service.QnaVO;

public class QnaServiceImpl implements QnaService {

	private SqlSession sqlSession = DataSources.getInstance().openSession(true);
	private QnaMapper map = sqlSession.getMapper(QnaMapper.class);

	@Override
	public List<QnaVO> qnaSelectList() {
		return map.qnaSelectList();
	}

	@Override
	public List<QnaVO> qnaMyList(String key, int pageNum, int amount) {
		return map.qnaMyList(key, pageNum, amount);
	}

	@Override
	public void updateQnaDone(QnaVO qna) {
		map.updateQnaDone(qna);
	}

	@Override
	public QnaVO qnaSelect(QnaVO vo) {
		return map.qnaSelect(vo);
	}

	@Override
	public int qnaInsert(QnaVO vo) {
		return map.qnaInsert(vo);
	}

	@Override
	public int qnaUpdate(QnaVO vo) {
		return map.qnaUpdate(vo);
	}

	@Override
	public int qnaDelete(QnaVO vo) {
		return map.qnaDelete(vo);
	}

	@Override
	public List<QnaVO> qnaPaging(int pageNum, int amount) {
		return map.qnaPaging(pageNum, amount);
	}

	@Override
	public int qnaTotalCount() {
		return map.qnaTotalCount();
	}

	@Override
	public int qnaMyTotalCount(String key) {
		return map.qnaMyTotalCount(key);
	}

}
