package user.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import user.service.IUserService;
import user.service.UserServiceImpl;
import user.vo.CustomerVO;

@WebServlet("/userDetail.do")
public class UserDetailController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String custId = req.getParameter("custId");
		
		IUserService userService = UserServiceImpl.getInstance();
		
		CustomerVO cv = userService.detailCostomer(custId);
		
		req.setAttribute("cv", cv);
		
		System.out.println("test~~~~~~");
		resp.getWriter().println(cv);
		RequestDispatcher dispatcher = req.getRequestDispatcher("./adminPage.jsp");
		
		dispatcher.forward(req, resp);
		
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String custId = req.getParameter("custId");
		
		IUserService userService = UserServiceImpl.getInstance();
		
		CustomerVO cv = userService.detailCostomer(custId);
		Gson gson = new Gson();
		String cust = gson.toJson(cv);
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("아이디", cv.getCustId());
		map.put("이름", cv.getCustName());
		map.put("이메일", cv.getCustMail());
		map.put("주소", cv.getCustAddr());
		map.put("성별", cv.getCustGender());
		map.put("핸드폰번호", cv.getCustTel());
		map.put("생년월일", cv.getCustBirth());
		map.put("닉네임", cv.getCustNickName());
		map.put("신고횟수", cv.getCustDecNum());
		
		req.setAttribute("cv", map);
		
		System.out.println("test~~~~~~");
		resp.getWriter().print(cust);
		
//		RequestDispatcher dispatcher = req.getRequestDispatcher("./adminPage.jsp");
		
//		dispatcher.forward(req, resp);
		
	}
}
