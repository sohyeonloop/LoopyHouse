package shop.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.service.IProductService;
import shop.service.IWishlistService;
import shop.service.ProductServiceImpl;
import shop.service.WishlistServiceImpl;

@WebServlet("/wishDelete.do")
public class WishDeleteController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String prodCode = req.getParameter("prodCode");
		
		IWishlistService wishService = WishlistServiceImpl.getInstance();
		IProductService prodService = ProductServiceImpl.getInstance();
		
		int cnt = wishService.deleteWish(prodCode);
		prodService.prodWishDown(prodCode);
		
		resp.getWriter().print(cnt);
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
