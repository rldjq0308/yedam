package co.yedam.gamerz.admin.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.gamerz.common.ViewResolve;
import co.yedam.gamerz.shipping.service.ShippingService;
import co.yedam.gamerz.shipping.service.ShippingVO;
import co.yedam.gamerz.shipping.serviceImpl.ShippingServiceImpl;

@WebServlet("/notification.do")
public class NotificationController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public NotificationController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ShippingService dao = new ShippingServiceImpl();
		List<ShippingVO> shippings = new ArrayList<>();
		
		shippings = dao.shippingList();
		request.setAttribute("shippings", shippings);

		String viewName = "manager/admin/notification";
		ViewResolve.forward(request, response, viewName);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
