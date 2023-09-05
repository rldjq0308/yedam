package co.yedam.gamerz.review.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.gamerz.common.ViewResolve;
import co.yedam.gamerz.review.service.ReviewService;
import co.yedam.gamerz.review.service.ReviewVO;
import co.yedam.gamerz.review.serviceImpl.ReviewServiceImpl;

@WebServlet("/reviewdelete.do")
public class ReviewDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReviewDelete() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ReviewService dao = new ReviewServiceImpl();
		ReviewVO vo = new ReviewVO();

		System.out.println("rid: "+ request.getParameter("reviewId") + ", rp: " + request.getParameter("reviewPage") + ", rpid: "+request.getParameter("reviewPageId")
		+"rpp: "+request.getParameter("reviewPagePath"));
		
		
		vo.setReviewId(Integer.valueOf(request.getParameter("reviewId")));
		int n = dao.reviewDelete(vo);
		String viewName = "review/reviewmessage";
		if (n == 1) {
			request.setAttribute("reviewPage", request.getParameter("reviewPage"));
			request.setAttribute("reviewPageId", request.getParameter("reviewPageId"));
			request.setAttribute("reviewPagePath", request.getParameter("reviewPagePath"));
			
			request.setAttribute("message", "리뷰를 삭제했습니다.");
			ViewResolve.forward(request, response, viewName);
		} else {
			request.setAttribute("message", "리뷰삭제실패");
			ViewResolve.forward(request, response, viewName);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
