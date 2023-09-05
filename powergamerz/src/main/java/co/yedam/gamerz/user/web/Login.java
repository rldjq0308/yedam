package co.yedam.gamerz.user.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.gamerz.common.ViewResolve;
import co.yedam.gamerz.user.service.MemberService;
import co.yedam.gamerz.user.service.MemberVO;
import co.yedam.gamerz.user.serviceImpl.MemberServiceImpl;

@WebServlet("/login.do")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Login() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberService dao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		HttpSession session = request.getSession();
		
		vo.setMemberId(request.getParameter("memberId"));
		vo.setMemberPassword(request.getParameter("memberPassword"));
		
		vo = dao.memberSelect(vo);

		if(vo != null) {
			session.setAttribute("id", vo.getMemberId());
			session.setAttribute("name", vo.getMemberName());
			session.setAttribute("author", vo.getMemberAuthor());
			
			String viewName = "home/home";
			ViewResolve.forward(request, response, viewName);
			// 홈으로
		} 
		else {
			// 아이디/비번 틀림 혹은 없음 알림
			response.setContentType("text/html; charset=UTF-8");
		    PrintWriter out = response.getWriter();
		    out.println("<script>alert('아이디 또는 비밀번호를 확인해주세요.'); history.go(-1);</script>");
		    out.flush();
		    response.flushBuffer();
		    out.close();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
