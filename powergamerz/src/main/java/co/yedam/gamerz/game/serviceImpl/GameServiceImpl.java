package co.yedam.gamerz.game.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.yedam.gamerz.common.DataSources;
import co.yedam.gamerz.game.mapper.GameMapper;
import co.yedam.gamerz.game.service.GameService;
import co.yedam.gamerz.game.service.GameVO;

public class GameServiceImpl implements GameService {
	private SqlSession sqlSession = DataSources.getInstance().openSession(true);
	private GameMapper map = sqlSession.getMapper(GameMapper.class);

	@Override
	public List<GameVO> gameSelectList() {
		return map.gameSelectList();
	}

	@Override
	public GameVO gameSelect(GameVO vo) {
		return map.gameSelect(vo);
	}

	@Override
	public List<GameVO> gameSearchList(String key) {
		return map.gameSearchList(key);
	}

	@Override
	public List<GameVO> gameGenreList(String key, int pageNum, int amount) {
		return map.gameGenreList(key, pageNum, amount);
	}

	@Override
	public List<GameVO> gamePlatformList(String val, int pageNum, int amount) {
		return map.gamePlatformList(val, pageNum, amount);
	}

	@Override
	public List<GameVO> gameClassficationList(String cla, int pageNum, int amount) {
		return map.gameClassficationList(cla, pageNum, amount);
	}

	@Override
	public List<GameVO> gamePromotionList(int pageNum, int amount) {
		return map.gamePromotionList(pageNum, amount);
	}

	@Override
	public List<GameVO> gamePromotionGenreList(String key, int pageNum, int amount) {
		return map.gamePromotionGenreList(key, pageNum, amount);
	}

	@Override
	public List<GameVO> gameGcList(String key, String cla, int pageNum, int amount) {
		return map.gameGcList(key, cla, pageNum, amount);
	}

	@Override
	public List<GameVO> gamePcList(String val, String cla, int pageNum, int amount) {
		return map.gamePcList(val, cla, pageNum, amount);
	}

	@Override
	public int gameInsert(GameVO vo) {
		return map.gameInsert(vo);
	}

	@Override
	public int gameUpdate(GameVO vo) {
		return map.gameUpdate(vo);
	}

	@Override
	public int gameDelete(GameVO vo) {
		return map.gameDelete(vo);
	}

	@Override
	public List<GameVO> gamePaging(int pageNum, int amount) {
		return map.gamePaging(pageNum, amount);
	}

	@Override
	public int gameTotalCount() {
		return map.gameTotalCount();
	}

	@Override
	public int gameGenreTotalCount(String key) {
		return map.gameGenreTotalCount(key);
	}

	@Override
	public int gamePlatformTotalCount(String val) {
		return map.gamePlatformTotalCount(val);
	}

	@Override
	public int gameClassficationTotalCount(String cla) {
		return map.gameClassficationTotalCount(cla);
	}

	@Override
	public int gamePromotionGenreTotalCount(String key) {
		return map.gamePromotionGenreTotalCount(key);
	}

	@Override
	public int gamePromotionTotalCount() {
		return map.gamePromotionTotalCount();
	}

	@Override
	public int gameGcTotalCount(String key, String cla) {
		return map.gameGcTotalCount(key, cla);
	}

	@Override
	public int gamePcTotalCount(String val, String cla) {
		return map.gamePcTotalCount(val, cla);
	}

}
