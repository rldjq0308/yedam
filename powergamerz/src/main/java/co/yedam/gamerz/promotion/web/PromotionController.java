package co.yedam.gamerz.promotion.web;

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

@WebServlet("/promotion.do")
public class PromotionController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PromotionController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		GameService dao = new GameServiceImpl();
		List<GameVO> gamepages = new ArrayList<GameVO>();

		int pageNum = 1;
		int amount = 8;
		PagingVO pagingVO = null;
		String key = request.getParameter("key");

		if (request.getParameter("pageNum") != null && request.getParameter("amount") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
			amount = Integer.parseInt(request.getParameter("amount"));
		}

		if (key != null) {
			// 프로모션 중 + 해당 장르에 대한 게임 목록을 가져오는 로직
			gamepages = dao.gamePromotionGenreList(key, pageNum, amount);
			int total = dao.gamePromotionGenreTotalCount(key);
			pagingVO = new PagingVO(pageNum, amount, total);
		} else {
			//  프로모션 중인 전체 게임 목록을 가져오는 로직
			gamepages = dao.gamePromotionList(pageNum, amount);
			int total = dao.gamePromotionTotalCount();
			pagingVO = new PagingVO(pageNum, amount, total);
		}
		
		request.setAttribute("gamepages", gamepages);
		request.setAttribute("pagingVO", pagingVO);

		String viewName = "promotion/promotion";
		ViewResolve.forward(request, response, viewName);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
