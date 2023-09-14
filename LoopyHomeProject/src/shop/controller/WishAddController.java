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
import shop.vo.WishListVO;

@WebServlet("/wishAdd.do")
public class WishAddController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String custId = req.getParameter("custId");
		String prodCode = req.getParameter("prodCode");
		
		IWishlistService wishService = WishlistServiceImpl.getInstance();
		IProductService prodService = ProductServiceImpl.getInstance();
		
		WishListVO wv = new WishListVO(custId, prodCode);
		
		int cnt = 0;
		
		
		if(custId != null) {
			cnt = wishService.insertWish(wv);
		
			prodService.prodWishUp(prodCode);
		}
		resp.getWriter().print(cnt);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
