package co.yedam.gamerz.cart.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.gamerz.cart.service.CartService;
import co.yedam.gamerz.cart.serviceImpl.CartServiceImpl;
import co.yedam.gamerz.common.ViewResolve;

@WebServlet("/cart.do")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CartController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		CartService dao = new CartServiceImpl();
		List<HashMap<String, Object>> carts = new ArrayList<HashMap<String, Object>>();
		
		
		carts = dao.cartList();
		request.setAttribute("carts", carts);
		
		String viewName = "user/cart";
		ViewResolve.forward(request, response, viewName);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
