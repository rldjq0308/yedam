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

@WebServlet("/qnainsert.do")
public class QnaInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public QnaInsert() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		QnaService dao = new QnaServiceImpl();
		QnaVO vo = new QnaVO();

		vo.setQnaWriterId(request.getParameter("qnaWriterId"));
		vo.setQnaWriter(request.getParameter("qnaWriter"));
		vo.setQnaTitle(request.getParameter("qnaTitle"));
		vo.setQnaSubject(request.getParameter("qnaSubject"));

		int n = dao.qnaInsert(vo);

		if (n == 1) {
			request.setAttribute("message", "1:1 문의에 글을 등록했습니다.");
		} else {
			request.setAttribute("message", "글등록에 실패했습니다.");
		}

		String viewName = "qna/qnamessage";
		ViewResolve.forward(request, response, viewName);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
