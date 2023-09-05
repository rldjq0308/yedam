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
 * Servlet implementation class FaqInsert
 */
@WebServlet("/faqinsert.do")
public class FaqInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FaqService dao = new FaqServiceImpl();
		FaqVO vo = new FaqVO();
		
		vo.setFaqWriterId(request.getParameter("faqWriterId"));
		vo.setFaqWriter(request.getParameter("faqWriter"));
		vo.setFaqTitle(request.getParameter("faqTitle"));
		vo.setFaqSubject(request.getParameter("faqSubject"));
		vo.setFaqDate(LocalDate.parse(request.getParameter("faqDate")));
		
		int n = dao.faqInsert(vo);
		
		if(n==1) {
			request.setAttribute("message", "FAQ 작성 성공.");
		}else {
			request.setAttribute("message", "FAQ 작성 실패.");
		}
		
		String viewName = "faq/faqmessage";
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
