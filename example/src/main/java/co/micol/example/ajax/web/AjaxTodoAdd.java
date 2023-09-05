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

@WebServlet("/AjaxTodoAdd")
public class AjaxTodoAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AjaxTodoAdd() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String todo = request.getParameter("todo");
		String dueDate = request.getParameter("dueDate");
		
		System.out.println(todo); 
		System.out.println(dueDate); 
		
		Map<String, Object> map = new HashMap<>();
		
		TodoVO vo = new TodoVO();
		vo.setTodo(todo);
		vo.setDueDate(dueDate);
		
		TodoService dao = new TodoServiceImpl();
		if(dao.todoAdd(vo)) {
			map.put("retCon", "Success");
			map.put("result", vo);
		}else {
			map.put("retCon", "Fail");
			map.put("result", "저장 중 에러 발생.");
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
