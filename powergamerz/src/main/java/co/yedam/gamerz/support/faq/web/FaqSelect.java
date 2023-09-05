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
 * Servlet implementation class FaqSelect
 */
@WebServlet("/faqselect.do")
public class FaqSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqSelect() {
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
		
		vo = dao.faqSelect(vo);
		
		request.setAttribute("f", vo);
		String viewName = "faq/faqselect";
		
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
