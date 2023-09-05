package co.yedam.gamerz.support.qna.web;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.gamerz.common.ViewResolve;
import co.yedam.gamerz.support.qna.service.QnaService;
import co.yedam.gamerz.support.qna.service.QnaVO;
import co.yedam.gamerz.support.qna.serviceImpl.QnaServiceImpl;

@WebServlet("/qnaedit.do")
public class QnaEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public QnaEdit() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		QnaService dao = new QnaServiceImpl();
		QnaVO vo = new QnaVO();

		vo.setQnaId(Integer.valueOf(request.getParameter("qnaId")));
		vo.setQnaDate(LocalDateTime.now());
		vo.setQnaTitle(request.getParameter("qnaTitle"));
		vo.setQnaSubject(request.getParameter("qnaSubject"));

		String viewName = "qna/qnamessage";

		int n = dao.qnaUpdate(vo);
		if (n == 1) {
			vo = dao.qnaSelect(vo);
			request.setAttribute("q", vo);
			request.setAttribute("message", "문의를 수정했습니다");
			ViewResolve.forward(request, response, viewName);
		} else {
			request.setAttribute("message", "글 수정 중 오류가 발생하였습니다.");	
			ViewResolve.forward(request, response, viewName);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
