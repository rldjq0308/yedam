package co.yedam.gamerz.support.faq.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.gamerz.common.ViewResolve;
import co.yedam.gamerz.support.faq.service.FaqService;
import co.yedam.gamerz.support.faq.service.FaqVO;
import co.yedam.gamerz.support.faq.serviceImpl.FaqServiceImpl;

/**
 * Servlet implementation class FaqDelete
 */
@WebServlet("/faqdelete.do")
public class FaqDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FaqService dao = new FaqServiceImpl();
		FaqVO vo = new FaqVO();
		
		vo.setFaqId(Integer.valueOf(request.getParameter("faqId")));
		int n = dao.faqDelete(vo);
		String viewName = "faq/faqmessage";
		if( n==1) {
			request.setAttribute("message", "삭제 성공");
			ViewResolve.forward(request, response, viewName);
		}else {
			request.setAttribute("message", "글 삭제 중 오류가 발생하였습니다.");
			ViewResolve.forward(request, response, viewName);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
