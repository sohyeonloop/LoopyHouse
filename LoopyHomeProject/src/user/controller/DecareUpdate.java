package user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.service.IUserService;
import user.service.UserServiceImpl;
import user.vo.CustomerVO;

@WebServlet("/decareUpdate.do")
public class DecareUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DecareUpdate() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.sendRedirect("./decare.jsp");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		String cusId = (String) request.getSession().getAttribute("custId");
		
		String decareId = request.getParameter("decareId");
		
		IUserService service = UserServiceImpl.getInstance();
		
		int res = service.decareUpdate(decareId);
		
		if(res > 0) {
			response.sendRedirect("./mypage.do?id=" + cusId);
		}else {
			response.sendRedirect("./decareUpdate.do");
		}
		
	
	}

}
