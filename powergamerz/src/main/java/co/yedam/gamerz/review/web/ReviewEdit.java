package co.yedam.gamerz.review.web;

import java.io.IOException;

import java.time.LocalDateTime;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.gamerz.common.ViewResolve;
import co.yedam.gamerz.review.service.ReviewService;
import co.yedam.gamerz.review.service.ReviewVO;
import co.yedam.gamerz.review.serviceImpl.ReviewServiceImpl;

@WebServlet("/reviewedit.do")
public class ReviewEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReviewEdit() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ReviewService dao = new ReviewServiceImpl();
		ReviewVO vo = new ReviewVO();

		
		vo.setReviewDate(LocalDateTime.now());
		
		vo.setReviewComment(request.getParameter("reviewComment"));
		vo.setReviewId(Integer.parseInt(request.getParameter("reviewId"))); // Fix this line

		String viewName = "review/reviewmessage";
		int n = dao.reviewUpdate(vo);

		if (n == 1) {			
			vo = dao.reviewSelect(vo);
			request.setAttribute("r", vo);
			request.setAttribute("reviewPage", request.getParameter("reviewPage"));
			request.setAttribute("reviewPageId", request.getParameter("reviewPageId"));
			request.setAttribute("reviewPagePath", request.getParameter("reviewPagePath"));
			request.setAttribute("message", "리뷰 수정 완료.");
			ViewResolve.forward(request, response, viewName);
		} else {

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
