package co.yedam.gamerz.game.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.gamerz.common.ViewResolve;
import co.yedam.gamerz.common.vo.PagingVO;
import co.yedam.gamerz.game.service.GameService;
import co.yedam.gamerz.game.service.GameVO;
import co.yedam.gamerz.game.serviceImpl.GameServiceImpl;

@WebServlet("/populargames.do")
public class PopularGamesController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PopularGamesController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		GameService dao = new GameServiceImpl();
		List<GameVO> gamepages = new ArrayList<GameVO>();

		int pageNum = 1;
		int amount = 12;
		PagingVO pagingVO = null;
		// 페이지 번호를 클릭하는 경우

		String key = request.getParameter("key");
		String val = request.getParameter("val");
		String cla = "Popular";
		if (request.getParameter("pageNum") != null && request.getParameter("amount") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
			amount = Integer.parseInt(request.getParameter("amount"));
		}

		if (key != null) {
			// 해당 장르에 대한 게임 목록을 가져오는 로직
			gamepages = dao.gameGcList(key, cla, pageNum, amount);
			int total = dao.gameGcTotalCount(key, cla);
			pagingVO = new PagingVO(pageNum, amount, total);
		} else if (val != null) {
			// 해당 플랫폼에 대한 게임 목록을 가져오는 로직
			gamepages = dao.gamePcList(val, cla, pageNum, amount);
			int total = dao.gamePcTotalCount(val, cla);
			pagingVO = new PagingVO(pageNum, amount, total);
		} else {
			// 전체 게임 목록을 가져오는 로직
			gamepages = dao.gameClassficationList(cla, pageNum, amount);
			int total = dao.gameClassficationTotalCount(cla);
			pagingVO = new PagingVO(pageNum, amount, total);
		}

		request.setAttribute("gamepages", gamepages);
		request.setAttribute("pagingVO", pagingVO);

		String viewName = "game/populargames";
		ViewResolve.forward(request, response, viewName);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
