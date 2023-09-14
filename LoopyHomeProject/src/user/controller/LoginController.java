package user.controller;

import java.io.IOException;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.service.IUserService;
import user.service.UserServiceImpl;
import user.vo.CustomerVO;
import user.vo.ManagerVO;


@WebServlet("/user/login.do")
public class LoginController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IUserService userService = UserServiceImpl.getInstance();
		HttpSession session = req.getSession();
		boolean check = false;
		String email = null;
		String password = null;
		String user = "";
		if(req.getParameter("mngId") != null) {
			email = req.getParameter("mngId");
			password = req.getParameter("userPw");
			ManagerVO mv = new ManagerVO();
			mv.setMngId(email);
			mv.setMngPwd(password);
			check = userService.checkMng(mv);
			user= "mng";
		}
		else {
			CustomerVO cv = new CustomerVO();
			email = req.getParameter("custId");
			password = req.getParameter("userPw");
			cv.setCustId(email);
			cv.setCustPwd(password);
			check = userService.checkCust(cv);
			user= "cust";
		}
		
		if(check && user.equals("mng")) {
			resp.getWriter().write("yes");
			session.setAttribute("mngId", email);
		}else if(check && user.equals("cust")){
			resp.getWriter().write("yes");
			session.setAttribute("custId", email);
		}
		else {
			resp.getWriter().write("no");
		}
		
	}
}
