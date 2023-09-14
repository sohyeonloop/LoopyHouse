package user.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.service.IItemService;
import shop.service.IOrderService;
import shop.service.IProductService;
import shop.service.ItemServiceImpl;
import shop.service.OrderServiceImpl;
import shop.service.ProductServiceImpl;
import shop.vo.ItemVO;
import shop.vo.OrderVO;
import shop.vo.ProductVO;
import shop.vo.ReviewVO;
import user.dao.IReviewDao;
import user.service.IMypageService;
import user.service.IReviewService;
import user.service.MypageServiceImpl;
import user.service.ReviewServiceImpl;

@WebServlet("/reviewWrite.do")
public class MyPageReviewController extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String prodCode = req.getParameter("PROD_CODE");
		String ordNo = req.getParameter("ORD_NO");
		System.out.println("prodCode : " + prodCode);
		System.out.println("ordNo : " + ordNo);
		
		
		IProductService prodService = ProductServiceImpl.getInstance();
		
		ProductVO pv = prodService.getDetail(prodCode);
		
		System.out.println(pv);
		
		
		req.setAttribute("pv", pv);
		req.setAttribute("prodCode", prodCode);
		req.setAttribute("ordNo", ordNo);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("./reviewWrite.jsp");
		dispatcher.forward(req, resp);
	}
}
