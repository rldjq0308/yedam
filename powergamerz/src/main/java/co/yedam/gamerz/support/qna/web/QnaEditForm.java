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

@WebServlet("/qnaeditform.do")
public class QnaEditForm extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public QnaEditForm() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		QnaService dao = new QnaServiceImpl();
		QnaVO vo = new QnaVO();

		vo.setQnaId(Integer.valueOf(request.getParameter("qnaId")));
		vo = dao.qnaSelect(vo);
		request.setAttribute("q", vo);
		String viewName = "qna/qnaeditform";
		ViewResolve.forward(request, response, viewName);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
