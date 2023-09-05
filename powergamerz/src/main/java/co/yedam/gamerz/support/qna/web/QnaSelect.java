package co.yedam.gamerz.support.qna.web;

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
import co.yedam.gamerz.support.qna.service.QnaService;
import co.yedam.gamerz.support.qna.service.QnaVO;
import co.yedam.gamerz.support.qna.serviceImpl.QnaServiceImpl;

@WebServlet("/qnaselect.do")
public class QnaSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public QnaSelect() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		QnaService dao = new QnaServiceImpl();
		QnaVO vo = new QnaVO();
		vo.setQnaId(Integer.valueOf(request.getParameter("qnaId")));

		vo = dao.qnaSelect(vo);

		request.setAttribute("q", vo);

		ReviewService dao2 = new ReviewServiceImpl();
		List<HashMap<String, Object>> reviewList = new ArrayList<HashMap<String, Object>>();

		reviewList = dao2.reviewSelectList();
		request.setAttribute("reviewlist", reviewList);

		String viewName = "qna/qnaselect";
		ViewResolve.forward(request, response, viewName);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
