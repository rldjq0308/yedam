package co.yedam.gamerz.game.service;

import java.time.LocalDate;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GameVO {
	private int gameId;
	private String gameName;
	private String gameDeveloper;
	private LocalDate gameReleaseDate;
	private int gamePrice;
	private String gameGenre;
	private String gamePlatform;
	private String gameDetailAbout;
	private int gamePriceDiscount;
	private String gameIllustMain;
	private String gameIllustMini;
	private String gameVideo;
	private String gameClassfication;
	private String gamePage;

}
