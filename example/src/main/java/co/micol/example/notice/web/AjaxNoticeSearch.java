package co.micol.example.notice.web;

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

import co.micol.example.notice.service.NoticeService;
import co.micol.example.notice.service.NoticeVO;
import co.micol.example.notice.serviceImpl.NoticeServiceImpl;

/**
 * Servlet implementation class AjaxNoticeSearch
 */
@WebServlet("/ajaxnoticesearch.do")
public class AjaxNoticeSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxNoticeSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ajax를 이용해서 검색결과를 json으로 보내준다
		NoticeService dao = new NoticeServiceImpl();
		List<NoticeVO> notices = new ArrayList<NoticeVO>();
		
		String key = request.getParameter("key");
		String val = request.getParameter("val");

		notices = dao.noticeSearchList(key, val);
		
		ObjectMapper objectMapper = new ObjectMapper();	//json 객체를 만들기 위해 필요한 객체
		
		objectMapper.registerModule(new JavaTimeModule()); //LocalDate 처리
		objectMapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS);
		
		String data = objectMapper.writeValueAsString(notices); //json 형태로 결과를 만들어줌
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().append(data);
		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
