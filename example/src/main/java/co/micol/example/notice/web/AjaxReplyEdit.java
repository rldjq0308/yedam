package co.micol.example.notice.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

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
 * Servlet implementation class AjaxReplyEdit
 */
@WebServlet("/AjaxReplyEdit.do")
public class AjaxReplyEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReplyEdit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rno = request.getParameter("rno");
		String noticeId = request.getParameter("noticeId");
		String reply = request.getParameter("reply");
		String replyer = request.getParameter("replyer");
		ReplyVO vo = new ReplyVO();
		vo.setReplyId(Integer.parseInt(rno));
		vo.setReply(reply);
		vo.setReplyer(replyer);
		vo.setNoticeId(Integer.parseInt(noticeId));
		
		ReplyService svc = new ReplyServiceImpl();	
		
		Map<String,Object> map = new HashMap<>();
		if(svc.editReply(vo)) {
			map.put("retCon", "Success");
			map.put("data", vo);
		}else {
			map.put("retCon", "Fail");
			map.put("data", "수정실패.");
		}
		
		Gson gson = new GsonBuilder().create();
		
		response.setContentType("text/json; charset=utf-8");
		response.getWriter().print(gson.toJson(map));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
