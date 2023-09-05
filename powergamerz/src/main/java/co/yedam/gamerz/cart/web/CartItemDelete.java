package co.yedam.gamerz.cart.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.gamerz.cart.service.CartService;
import co.yedam.gamerz.cart.service.CartVO;
import co.yedam.gamerz.cart.serviceImpl.CartServiceImpl;
import co.yedam.gamerz.common.ViewResolve;

@WebServlet("/cartitemdelete.do")
public class CartItemDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CartItemDelete() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CartService dao = new CartServiceImpl();
		CartVO vo = new CartVO();

		vo.setCartPersonal(request.getParameter("cartPersonal"));
		vo.setItemId(Integer.valueOf(request.getParameter("itemId")));
		int num = dao.cartDelete(vo);
		String viewName = "user/cartmessage";

		if (num == 1) {
			request.setAttribute("message", "Succeed Delete to Cart");
			ViewResolve.forward(request, response, viewName);
		} else {
			request.setAttribute("message", "Fail Delete to Cart.");
			ViewResolve.forward(request, response, viewName);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
