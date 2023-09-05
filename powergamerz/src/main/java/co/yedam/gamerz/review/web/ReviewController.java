package co.yedam.gamerz.review.web;

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
import co.yedam.gamerz.review.service.ReviewService;
import co.yedam.gamerz.review.serviceImpl.ReviewServiceImpl;


@WebServlet("/review.do")
public class ReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ReviewController() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReviewService dao = new ReviewServiceImpl();
		List<HashMap<String, Object>> reviewList = new ArrayList<HashMap<String, Object>>();
		
		reviewList = dao.reviewSelectList();
		request.setAttribute("reviewlist", reviewList);
		
		String viewName = "game/gameinfo";
		ViewResolve.forward(request, response, viewName);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
