package co.yedam.gamerz.game.service;

import java.util.List;

public interface GameService {
	List<GameVO> gameSelectList();
	
	
	List<GameVO> gameSearchList(String key);
	
	List<GameVO> gameGenreList(String key, int pageNum, int amount);

	List<GameVO> gamePlatformList(String val, int pageNum, int amount);
	
	List<GameVO> gameClassficationList(String cla, int pageNum, int amount);
	
	List<GameVO> gamePromotionList(int pageNum, int amount);
	List<GameVO> gamePromotionGenreList(String key, int pageNum, int amount);
		
	List<GameVO> gameGcList(String key, String cla, int pageNum, int amount);
	
	List<GameVO> gamePcList(String val, String cla, int pageNum, int amount);
	
	GameVO gameSelect(GameVO vo);

	List<GameVO> gamePaging(int pageNum, int amount);

	int gameTotalCount();

	int gameGenreTotalCount(String key);
	
	int gamePlatformTotalCount(String val);
	
	int gameClassficationTotalCount(String cla);
	
	int gamePromotionTotalCount();
	int gamePromotionGenreTotalCount(String key);
	
	int gameGcTotalCount(String key, String cla);
	
	int gamePcTotalCount(String val, String cla);
	
	int gameInsert(GameVO vo);

	int gameUpdate(GameVO vo);

	int gameDelete(GameVO vo);

}
