package user.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.vo.ReviewVO;
import user.service.IReviewService;
import user.service.ReviewServiceImpl;
@WebServlet("/review.do")
public class ReviewController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String prodCode = req.getParameter("prodCode");
		String prodName = req.getParameter("prodName");
		IReviewService revService = ReviewServiceImpl.getInstance();
		
		List<ReviewVO> revList = revService.getReview(prodCode);
		
		req.setAttribute("revList", revList);
		req.setAttribute("prodName", prodName);
		RequestDispatcher dispatcher = req.getRequestDispatcher("./review.jsp");
		dispatcher.forward(req, resp);
		
	}
}
