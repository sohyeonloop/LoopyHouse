package user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.service.IItemService;
import shop.service.ItemServiceImpl;
import shop.vo.ItemVO;
import shop.vo.ReviewVO;
import user.dao.IReviewDao;
import user.service.IReviewService;
import user.service.ReviewServiceImpl;

@WebServlet("/insertReview.do")
public class InsertReviewController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IReviewService revService = ReviewServiceImpl.getInstance();
		IItemService itemService = ItemServiceImpl.getInstance();
		
		String prodCode = req.getParameter("prodCode");
		String revContent = req.getParameter("content");
		String custId = req.getParameter("userId");

		String ordNo = req.getParameter("ordNo");
		
		String[] arr = revContent.split("tomcatImg/");
		
		String revImage = "";
		int idx = arr[1].indexOf("\"");
		revImage = arr[1].substring(0, idx);
		
		ReviewVO rv = new ReviewVO(revContent, ordNo, prodCode, custId, revImage);
		
		ItemVO iv = new ItemVO(ordNo,prodCode);
		
		
		int cnt = revService.insertReview(rv);
		int cnt2 = itemService.itemStUpdate(iv);
		resp.sendRedirect(req.getContextPath()+"/index.jsp");
		
		
		
	}
	
}
