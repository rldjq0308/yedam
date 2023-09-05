package co.yedam.gamerz.support.faq.web;

import java.io.IOException;
import java.time.LocalDate;

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
 * Servlet implementation class FaqEdit
 */
@WebServlet("/faqedit.do")
public class FaqEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqEdit() {
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
		vo.setFaqDate(LocalDate.parse(request.getParameter("faqDate")));
		vo.setFaqTitle(request.getParameter("faqTitle"));
		vo.setFaqSubject(request.getParameter("faqSubject"));
		
		String viewName = "faq/faqselect";
		int n = dao.faqUpdate(vo);
		if( n==1) {
			vo = dao.faqSelect(vo);
			request.setAttribute("f", vo);
			ViewResolve.forward(request, response, viewName);
		}else {
			request.setAttribute("message", "글 수정 중 오류가 발생하였습니다.");
			viewName = "faq/faqmessage";
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
