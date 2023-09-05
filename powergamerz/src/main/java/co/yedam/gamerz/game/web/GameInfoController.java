package co.yedam.gamerz.game.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.gamerz.common.ViewResolve;
import co.yedam.gamerz.game.service.GameService;
import co.yedam.gamerz.game.service.GameVO;
import co.yedam.gamerz.game.serviceImpl.GameServiceImpl;
import co.yedam.gamerz.review.service.ReviewService;
import co.yedam.gamerz.review.serviceImpl.ReviewServiceImpl;

@WebServlet("/gameinfo.do")
public class GameInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GameInfoController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		GameService dao = new GameServiceImpl();
		GameVO vo = new GameVO();

		String gameIdParam = request.getParameter("gameId");
		if (gameIdParam != null) {
			try {
				vo.setGameId(Integer.valueOf(gameIdParam));
			} catch (NumberFormatException e) {
				// gameId 파라미터가 숫자 형식이 아닐 경우 처리
				// 예: 오류 페이지로 리다이렉트 또는 오류 메시지 출력
			}
		}

		vo = dao.gameSelect(vo);
		request.setAttribute("g", vo);

		ReviewService dao2 = new ReviewServiceImpl();
		List<HashMap<String, Object>> reviewList = new ArrayList<HashMap<String, Object>>();

		reviewList = dao2.reviewSelectList();
		request.setAttribute("reviewlist", reviewList);

		String viewName = "game/gameinfo";
		ViewResolve.forward(request, response, viewName);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
