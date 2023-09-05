package co.yedam.gamerz.game.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.yedam.gamerz.game.service.GameVO;

public interface GameMapper {
	List<GameVO> gameSelectList();
	
	
	List<GameVO> gameSearchList(@Param("key") String key);
	List<GameVO> gameGenreList(@Param("key") String key, @Param("pageNum") int pageNum, @Param("amount") int amount);

	List<GameVO> gamePlatformList(@Param("val") String val, @Param("pageNum") int pageNum, @Param("amount") int amount);

	List<GameVO> gameClassficationList(@Param("cla") String cla, @Param("pageNum") int pageNum,
			@Param("amount") int amount);

	List<GameVO> gamePromotionList(@Param("pageNum") int pageNum, @Param("amount") int amount);

	List<GameVO> gamePromotionGenreList(@Param("key") String key, @Param("pageNum") int pageNum,
			@Param("amount") int amount);
  
	List<GameVO> gameGcList(@Param("key") String key, @Param("cla") String cla, @Param("pageNum") int pageNum,
			@Param("amount") int amount);
	
	List<GameVO> gamePcList(@Param("val") String val, @Param("cla") String cla, @Param("pageNum") int pageNum,
			@Param("amount") int amount);
	
	GameVO gameSelect(GameVO vo);

	List<GameVO> gamePaging(@Param("pageNum") int pageNum, @Param("amount") int amount);

	int gameTotalCount();

	int gameGenreTotalCount(@Param("key") String key);
			
	int gamePlatformTotalCount(@Param("val") String val);

	int gameClassficationTotalCount(@Param("cla") String cla);

	int gamePromotionTotalCount();

	int gamePromotionGenreTotalCount(@Param("key") String key);
	
	int gameGcTotalCount(@Param("key") String key, @Param("cla") String cla);
	
	int gamePcTotalCount(@Param("val") String key, @Param("cla") String cla);
	
	int gameInsert(GameVO vo);

	int gameUpdate(GameVO vo);

	int gameDelete(GameVO vo);
}
