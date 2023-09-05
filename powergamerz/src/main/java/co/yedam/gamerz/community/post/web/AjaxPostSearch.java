package co.yedam.gamerz.community.post.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import co.yedam.gamerz.community.post.service.PostService;
import co.yedam.gamerz.community.post.service.PostVO;
import co.yedam.gamerz.community.post.serviceImpl.PostServiceImpl;

@WebServlet("/ajaxpostsearch.do")
public class AjaxPostSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AjaxPostSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostService dao = new PostServiceImpl();
		List<PostVO> posts = new ArrayList<PostVO>();
		
		String key = request.getParameter("key");
		String val = request.getParameter("val");
		
		posts = dao.postSearchtList(key, val);
			
		System.out.println("key: " + key + ",val: " + val);
		
		ObjectMapper objectMapper = new ObjectMapper();	//json 객체를 만들기 위해 필요한 객체
		
		objectMapper.registerModule(new JavaTimeModule()); //LocalDate 처리
		objectMapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS);
		
		String data = objectMapper.writeValueAsString(posts); //json 형태로 결과를 만들어줌

		System.out.println(data);
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().append(data);
		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
