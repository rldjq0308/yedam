package co.yedam.gamerz.community.post.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.yedam.gamerz.community.post.service.PostVO;

public interface PostMapper {
	List<PostVO> postSelectList();
	List<PostVO> postSearchtList(@Param("key") String key, @Param("val") String val);
	PostVO postSelect(PostVO vo);
	int postInsert(PostVO vo);
	int postUpdate(PostVO vo);
	int postDelete(PostVO vo);
	void postUpdateHit(int id);
	List<PostVO> postPaging(@Param("pageNum") int pageNum, @Param("amount") int amount);
	int postTotalCount();
	int postTotalCnt(@Param("key") String key, @Param("val") String val);
	List<PostVO> postPagingC(@Param("pageNum") int pageNum, @Param("amount") int amount, @Param("key") String key, @Param("val") String val );
}
