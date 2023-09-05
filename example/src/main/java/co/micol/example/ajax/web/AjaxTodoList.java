package co.micol.example.ajax.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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

@WebServlet("/AjaxTodoList")
public class AjaxTodoList extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AjaxTodoList() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TodoService dao = new TodoServiceImpl();
		List<TodoVO> vo = new ArrayList<>();
		
		vo = dao.todoList();
		
		Gson gson = new GsonBuilder().create();
		response.setContentType("text/json; charset=utf-8");
		response.getWriter().print(gson.toJson(vo));
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
