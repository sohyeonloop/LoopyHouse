package shop.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.service.IProductService;
import shop.service.IWishlistService;
import shop.service.ProductServiceImpl;
import shop.service.WishlistServiceImpl;
import shop.vo.ProductVO;
import shop.vo.WishListVO;
import user.vo.CustomerVO;

@WebServlet("/furniture.do")
public class FurnitureController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		
		IProductService prodService = ProductServiceImpl.getInstance();
		IWishlistService wishService = WishlistServiceImpl.getInstance();
		
		String cateCode = req.getParameter("cateCode");
		String custId = req.getParameter("custId");
		String prodCode = req.getParameter("prodCode");
		boolean wishList = false;
		List<ProductVO> pvList = prodService.selectCateProd(cateCode);
		List<ProductVO> pSaleList = prodService.selectSaleProd(cateCode);
		List<ProductVO> pWishList = prodService.selectWishProd(cateCode);
		
		req.setAttribute("pvList", pvList);
		req.setAttribute("pSaleList", pSaleList);
		req.setAttribute("pWishList", pWishList);
		
		//위시리스트 여부
		if(custId != null) {
			
			WishListVO wv = new WishListVO(custId, prodCode);
			
			wishList = wishService.wishChk(wv);
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("./furniture.jsp");
		
		dispatcher.forward(req, resp);
		
	}
}
