package co.yedam.gamerz.community.post.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.gamerz.common.ViewResolve;
import co.yedam.gamerz.community.post.service.PostService;
import co.yedam.gamerz.community.post.service.PostVO;
import co.yedam.gamerz.community.post.serviceImpl.PostServiceImpl;
import co.yedam.gamerz.review.service.ReviewService;
import co.yedam.gamerz.review.serviceImpl.ReviewServiceImpl;

@WebServlet("/postselect.do")
public class PostSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PostSelect() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostService dao = new PostServiceImpl();
		PostVO vo = new PostVO();
		vo.setPostId(Integer.valueOf(request.getParameter("postId")));
		
		System.out.println(request.getParameter("postId"));
		
		vo = dao.postSelect(vo);
		
		request.setAttribute("p", vo);
		
		ReviewService dao2 = new ReviewServiceImpl();
		List<HashMap<String, Object>> reviewList = new ArrayList<HashMap<String, Object>>();

		reviewList = dao2.reviewSelectList();
		request.setAttribute("reviewlist", reviewList);
		
		String viewName = "community/postselect";
		
		ViewResolve.forward(request, response, viewName);	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
