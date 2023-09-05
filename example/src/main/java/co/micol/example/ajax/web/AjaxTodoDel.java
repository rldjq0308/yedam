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
import co.micol.example.ajax.serviceImpl.TodoServiceImpl;

@WebServlet("/AjaxTodoDel")
public class AjaxTodoDel extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AjaxTodoDel() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int listNo = Integer.parseInt(request.getParameter("listNo"));
		TodoService dao = new TodoServiceImpl();
		Map<String,Object> map = new HashMap<>();
		
		if(dao.todoDel(listNo)) {
			map.put("retCont", "Success");
			map.put("result", listNo);
		}else {
			map.put("retCont", "Fail");
			map.put("result", "삭제 실패.");
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
