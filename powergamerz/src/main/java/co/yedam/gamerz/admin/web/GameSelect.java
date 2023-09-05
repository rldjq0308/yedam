package co.yedam.gamerz.admin.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.gamerz.common.ViewResolve;
import co.yedam.gamerz.game.service.GameService;
import co.yedam.gamerz.game.service.GameVO;
import co.yedam.gamerz.game.serviceImpl.GameServiceImpl;

@WebServlet("/gameselect.do")
public class GameSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GameSelect() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GameService dao = new GameServiceImpl();
		GameVO vo = new GameVO();
		
		vo.setGameId(Integer.valueOf(request.getParameter("gameId")));
		
		request.setAttribute("n", vo);
		String viewName = "manager/admin/editgame";
		ViewResolve.forward(request, response, viewName);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
