package co.micol.example.ajax.web;

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

import co.micol.example.ajax.service.TodoService;
import co.micol.example.ajax.service.TodoVO;
import co.micol.example.ajax.serviceImpl.TodoServiceImpl;

@WebServlet("/AjaxTodoEdit")
public class AjaxTodoEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AjaxTodoEdit() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String listNo = request.getParameter("listNo");
		String complete = request.getParameter("complete");
		TodoService dao = new TodoServiceImpl();
		TodoVO vo = new TodoVO();
		
		System.out.println(listNo);
		System.out.println(complete);
		
		vo.setListNo(Integer.parseInt(listNo));
		vo.setComplete(complete);
		
		Map<String,Object> map = new HashMap<>();
		
		if(dao.todoEdit(vo)) {
			map.put("ret", "Success");
			map.put("res", vo);
		}else {
			map.put("ret", "Fail");
			map.put("res", "수정실패");
		}
		
		Gson gson = new GsonBuilder().create();
		response.setContentType("text/json; charset=utf-8");
		response.getWriter().print(gson.toJson(map));
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
