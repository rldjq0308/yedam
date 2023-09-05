package co.yedam.gamerz.support.qna.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.gamerz.common.ViewResolve;
import co.yedam.gamerz.support.qna.service.QnaService;
import co.yedam.gamerz.support.qna.service.QnaVO;
import co.yedam.gamerz.support.qna.serviceImpl.QnaServiceImpl;

@WebServlet("/qnadelete.do")
public class QnaDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public QnaDelete() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		QnaService dao = new QnaServiceImpl();
		QnaVO vo = new QnaVO();

		vo.setQnaId(Integer.valueOf(request.getParameter("qnaId")));
		int n = dao.qnaDelete(vo);
		String viewName = "qna/qnamessage";
		if (n == 1) {
			request.setAttribute("message", "삭제 성공");
			ViewResolve.forward(request, response, viewName);
		} else {
			request.setAttribute("message", "글 삭제 중 오류가 발생하였습니다.");
			ViewResolve.forward(request, response, viewName);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
