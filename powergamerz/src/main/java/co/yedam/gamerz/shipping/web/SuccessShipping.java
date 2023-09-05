package co.yedam.gamerz.shipping.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.gamerz.common.ViewResolve;
import co.yedam.gamerz.shipping.service.ShippingService;
import co.yedam.gamerz.shipping.service.ShippingVO;
import co.yedam.gamerz.shipping.serviceImpl.ShippingServiceImpl;

@WebServlet("/success.do")
public class SuccessShipping extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SuccessShipping() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ShippingService dao = new ShippingServiceImpl();
		ShippingVO vo = new ShippingVO();
		HttpSession session = request.getSession();
		
		String chaseName = (String) session.getAttribute("name");
		
		vo.setChaseName(chaseName);
		vo.setChaseId(Integer.valueOf(request.getParameter("orderId")));
		vo.setChasePrice(Integer.valueOf(request.getParameter("amount")));		

		int num = dao.shippingInsert(vo);

		if (num == 1) {
			String viewName = "payment/success";
			ViewResolve.forward(request, response, viewName);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
