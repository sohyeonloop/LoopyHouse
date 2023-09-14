package shop.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.service.IProductService;
import shop.service.ProductServiceImpl;
import shop.vo.ProductVO;

@WebServlet("/digitalDetail.do")
public class DigitalDetailController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		doPost(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String prodCode = req.getParameter("prodCode");
		
		IProductService prodService = ProductServiceImpl.getInstance();
		
		ProductVO pv = prodService.getDetail(prodCode);
		
		req.setAttribute("pv", pv);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("./productDetail.jsp.jsp");
		
		dispatcher.forward(req, resp);
				
	}

}
