package co.yedam.gamerz.community.post.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.yedam.gamerz.common.DataSources;
import co.yedam.gamerz.community.post.mapper.PostMapper;
import co.yedam.gamerz.community.post.service.PostService;
import co.yedam.gamerz.community.post.service.PostVO;

public class PostServiceImpl implements PostService {
	private SqlSession sqlSession = DataSources.getInstance().openSession(true);
	private PostMapper map = sqlSession.getMapper(PostMapper.class);
	
	@Override
	public List<PostVO> postSelectList() {
		// TODO Auto-generated method stub
		return map.postSelectList();
	}

	@Override
	public List<PostVO> postSearchtList(String key, String val) {
		// TODO Auto-generated method stub
		return map.postSearchtList(key, val);
	}

	@Override
	public PostVO postSelect(PostVO vo) {
		// TODO Auto-generated method stub
		return map.postSelect(vo);
	}

	@Override
	public int postInsert(PostVO vo) {
		// TODO Auto-generated method stub
		return map.postInsert(vo);
	}

	@Override
	public int postUpdate(PostVO vo) {
		// TODO Auto-generated method stub
		return map.postUpdate(vo);
	}

	@Override
	public int postDelete(PostVO vo) {
		// TODO Auto-generated method stub
		return map.postDelete(vo);
	}

	@Override
	public void postUpdateHit(int id) {
		// TODO Auto-generated method stub
		map.postUpdateHit(id);

	}

	@Override
	public List<PostVO> postPaging(int pageNum, int amount) {
		// TODO Auto-generated method stub
		return map.postPaging(pageNum, amount);
	}

	@Override
	public int postTotalCount() {
		// TODO Auto-generated method stub
		return map.postTotalCount();
	}

	@Override
	public int postTotalCnt(String key, String val) {
		// TODO Auto-generated method stub
		return map.postTotalCnt(key, val);
	}

	@Override
	public List<PostVO> postPagingC(int pageNum, int amount, String key, String val) {
		// TODO Auto-generated method stub
		return map.postPagingC(pageNum, amount, key, val);
	}

}
