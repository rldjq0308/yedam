package co.yedam.gamerz.support.qna.service;

import java.util.List;

public interface QnaService {
	List<QnaVO> qnaSelectList();

	List<QnaVO> qnaMyList(String key, int pageNum, int amount);
	
	void updateQnaDone(QnaVO qna);
	
	QnaVO qnaSelect(QnaVO vo);
	
	int qnaInsert(QnaVO vo);

	int qnaUpdate(QnaVO vo);

	int qnaDelete(QnaVO vo);

	List<QnaVO> qnaPaging(int pageNum, int amount);

	int qnaTotalCount();

	int qnaMyTotalCount(String key);
}
