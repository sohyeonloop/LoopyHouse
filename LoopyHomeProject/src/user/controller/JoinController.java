package user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.service.IUserService;
import user.service.UserServiceImpl;
import user.vo.CustomerVO;

@WebServlet("/join.do")
public class JoinController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/join.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String custId = req.getParameter("custId");
		String custName = req.getParameter("custName");
		String custMail = req.getParameter("custMail");
		String custAddr = req.getParameter("custAddr");
		String custGender = req.getParameter("custGender");
		String custTel = req.getParameter("custTel");
		String custBirth = req.getParameter("custBirth");
		String custNickName = req.getParameter("custNickName");
		String custPwd = req.getParameter("custPwd");
		
		IUserService userService = UserServiceImpl.getInstance();
		
		CustomerVO cv = new CustomerVO(custId, custName, custMail, custAddr, custGender, custTel, custBirth, custNickName, custPwd);
		
		int cnt = userService.joinCustomer(cv);
		
		String msg = "";
		
		if(cnt>0) {
			msg = "성공";
		} else {
			msg = "실패";
		}
		
		req.getSession().setAttribute("msg", msg);
		
		
		
	}
	
	
}
