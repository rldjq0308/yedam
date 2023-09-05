package co.yedam.gamerz.community.post.service;

import java.util.List;

public interface PostService {
	List<PostVO> postSelectList();
	List<PostVO> postSearchtList(String key,String val);
	PostVO postSelect(PostVO vo);
	int postInsert(PostVO vo);
	int postUpdate(PostVO vo);
	int postDelete(PostVO vo);
	void postUpdateHit(int id);
	List<PostVO> postPaging(int pageNum, int amount);
	int postTotalCount();
	int postTotalCnt(String key,String val);	
	List<PostVO> postPagingC(int pageNum, int amount,String key,String val);
}
