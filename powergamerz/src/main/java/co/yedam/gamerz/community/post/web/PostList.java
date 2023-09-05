package co.yedam.gamerz.community.post.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.gamerz.common.ViewResolve;
import co.yedam.gamerz.common.vo.PagingVO;
import co.yedam.gamerz.community.post.service.PostService;
import co.yedam.gamerz.community.post.service.PostVO;
import co.yedam.gamerz.community.post.serviceImpl.PostServiceImpl;

@WebServlet("/postlist.do")
public class PostList extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PostList() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostService dao = new PostServiceImpl();
		List<PostVO> posts = new ArrayList<PostVO>();
		
		posts = dao.postSelectList();
			
		String key = request.getParameter("key");
		String val = request.getParameter("val");
		
		System.out.println("key: "+key +"val: "+val);
		
		int pageNum = 1;
		int amount = 5;
		// 페이지 번호를 클릭하는 경우
		if (request.getParameter("pageNum") != null && request.getParameter("amount") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
			amount =Integer.parseInt(request.getParameter("amount"));
		}
		List<PostVO> postpages = null; 
		PagingVO pagingVO = null;
		

		if (key != null && val != null) {
			posts = dao.postSearchtList(key, val);	
			int total = dao.postTotalCnt(key,val);		
			pagingVO = new PagingVO(pageNum, amount, total);
			postpages = dao.postPagingC(pageNum, amount, key, val);
			
			System.out.println(total);
			for(PostVO post : postpages) {
				System.out.println(post);
			}
		}else {
			int total = dao.postTotalCount();
			pagingVO = new PagingVO(pageNum, amount, total);
			postpages = dao.postPaging(pageNum, amount);
		}	
		request.setAttribute("posts", posts);
		request.setAttribute("postpages", postpages);
		request.setAttribute("pagingVO", pagingVO);
		
		String viewName = "community/postlist";
		ViewResolve.forward(request, response, viewName);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
