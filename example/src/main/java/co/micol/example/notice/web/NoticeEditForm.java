package co.micol.example.notice.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.example.common.ViewResolve;
import co.micol.example.notice.service.NoticeService;
import co.micol.example.notice.service.NoticeVO;
import co.micol.example.notice.serviceImpl.NoticeServiceImpl;

/**
 * Servlet implementation class NoticeEditForm
 */
@WebServlet("/noticeeditform.do")
public class NoticeEditForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeEditForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeService dao = new NoticeServiceImpl();
		NoticeVO vo = new NoticeVO();
		
		vo.setNoticeId(Integer.valueOf(request.getParameter("noticeId")));
		vo = dao.noticeSelect(vo);
		request.setAttribute("n", vo);
		String viewName = "notice/noticeeditform";
		ViewResolve.forward(request, response, viewName);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
