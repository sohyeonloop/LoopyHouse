package shop.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.service.IOrderService;
import shop.service.OrderServiceImpl;
import shop.vo.OrderVO;

@WebServlet("/orderDelete.do")
public class OrderDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public OrderDelete() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String cusId = (String) request.getSession().getAttribute("custId");
		String ordNo = request.getParameter("ordNo");

		OrderVO ov = new OrderVO();

		ov.setCustId(cusId);
		ov.setOrdNo(ordNo);

		IOrderService service = OrderServiceImpl.getinstance();

		int res = service.deleteOrder(ov);

		int returnRes = service.insertReturn(ordNo);

		if (res > 0) {
			response.sendRedirect("./mypage.do?id=" + cusId);
		} else {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('반품이 실패하였습니다.');");
			out.println("window.location.href = './mypage.do?id=" + cusId + "';");
			out.println("</script>");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
