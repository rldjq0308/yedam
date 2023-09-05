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

@WebServlet("/cartadd.do")
public class CartAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public CartAdd() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CartService dao = new CartServiceImpl();
		CartVO vo = new CartVO();
		
		vo.setItemId(Integer.valueOf(request.getParameter("itemId")));
        vo.setCartTotal(Integer.valueOf(request.getParameter("cartTotal")));
        vo.setCartPersonal(request.getParameter("cartPersonal"));
		
		int num = dao.cartInsert(vo);
		
		if (num == 1 ) {
			request.setAttribute("message", "Succeed Add to Cart");
		} else {
			request.setAttribute("message", "Fail Add to Cart");
		}
		
		String viewName = "user/cartmessage";
		ViewResolve.forward(request, response, viewName);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
