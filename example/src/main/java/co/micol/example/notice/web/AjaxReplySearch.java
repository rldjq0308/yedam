package co.micol.example.notice.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.micol.example.notice.service.ReplyService;
import co.micol.example.notice.service.ReplyVO;
import co.micol.example.notice.serviceImpl.ReplyServiceImpl;

/**
 * Servlet implementation class AjaxReplySearch
 */
@WebServlet("/AjaxReplySearch.do")
public class AjaxReplySearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReplySearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String rno = request.getParameter("rno");
		
		ReplyService svc = new ReplyServiceImpl();
		ReplyVO vo = svc.getReply(Integer.parseInt(rno));
		
		Gson gson = new GsonBuilder().create();
		
		response.setContentType("text/json; charset=utf-8");
		response.getWriter().print(gson.toJson(vo));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
