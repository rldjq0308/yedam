package co.yedam.gamerz.user.serviceImpl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import co.yedam.gamerz.user.service.MemberService;
import co.yedam.gamerz.user.service.MemberVO;

@WebServlet("/ajaxselectuser.do")
public class AjaxSelectUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AjaxSelectUser() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberService dao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		
		String val = request.getParameter("val");

		vo = dao.memberSelect(vo);
		
		ObjectMapper objectmapper = new ObjectMapper();
		
		String data = objectmapper.writeValueAsString(vo);
		
		System.out.println(data);
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().append(data);
		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
