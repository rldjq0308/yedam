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

@WebServlet("/cartitemdelete2.do")
public class CartItemDelete2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public CartItemDelete2() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CartService dao = new CartServiceImpl();
		CartVO vo = new CartVO();

		vo.setCartPersonal(request.getParameter("cartPersonal"));
		
		int num2 = dao.cartPayDelete(vo);
		String viewName2 = "payment/paymessage";
		
		if (num2 == 1) {
			request.setAttribute("message", "결제창을 종료하고 홈으로 돌아갑니다");
			ViewResolve.forward(request, response, viewName2);
		} else {
			request.setAttribute("message", "결제창을 종료하지 못하였습니다.");
			ViewResolve.forward(request, response, viewName2);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
