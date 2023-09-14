package user.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;

import user.service.IUserService;
import user.service.UserServiceImpl;
import user.vo.CustomerVO;
import util.MessageTemplate;

@WebServlet("/findPwd.do")
public class FindPwController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String custId = req.getParameter("custName");
		String custTel = req.getParameter("custTel");
		
		System.out.println("********************");
		System.out.println(custId);
		System.out.println(custTel);
		System.out.println("********************");
//		System.out.println(custTel.getClass().getName());
			
		IUserService userService = UserServiceImpl.getInstance();
		
		MessageTemplate template = new MessageTemplate();
		
		// 조회함
		CustomerVO cv = userService.findId(custTel);
		System.out.println("컨트롤러"+cv.getCustTel());
		template.sendOne(cv.getCustTel(), cv.getCustPwd());
		
	}
	
	
}
