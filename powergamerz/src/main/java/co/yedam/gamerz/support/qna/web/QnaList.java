package co.yedam.gamerz.support.qna.web;

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
import co.yedam.gamerz.support.qna.service.QnaService;
import co.yedam.gamerz.support.qna.service.QnaVO;
import co.yedam.gamerz.support.qna.serviceImpl.QnaServiceImpl;

@WebServlet("/qnalist.do")
public class QnaList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public QnaList() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		QnaService dao = new QnaServiceImpl();
		List<QnaVO> qnapages = new ArrayList<QnaVO>();

		PagingVO pagingVO = null;
		int pageNum = 1;
		int amount = 10;
		// 페이지 번호를 클릭하는 경우

		String key = request.getParameter("key");

		if (request.getParameter("pageNum") != null && request.getParameter("amount") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
			amount = Integer.parseInt(request.getParameter("amount"));
		}
		if (key != null) {
			qnapages = dao.qnaMyList(key, pageNum, amount);
			int total = dao.qnaMyTotalCount(key);
			pagingVO = new PagingVO(pageNum, amount, total);
		} else {
			qnapages = dao.qnaPaging(pageNum, amount);
			int total = dao.qnaTotalCount();
			pagingVO = new PagingVO(pageNum, amount, total);
		}

		request.setAttribute("qnapages", qnapages);
		request.setAttribute("pagingVO", pagingVO);

		String viewName = "qna/qnalist";
		ViewResolve.forward(request, response, viewName);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
