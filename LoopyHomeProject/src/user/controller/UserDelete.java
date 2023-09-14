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

@WebServlet("/delete.do")
public class UserDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserDelete() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 1. 클라이언트에서 id값 받아오기
		String userId = request.getParameter("id");

		// 2. service객체 얻어오기
		IUserService service = UserServiceImpl.getInstance();

		// 3. service메소드 호출하기 - id정보를 조회 결과값 받기
		CustomerVO cv = service.detailCostomer(userId);

		// 4. 결과값을 request에 저장하기
		request.setAttribute("cv", cv);

		request.getRequestDispatcher("/custDelete.jsp").forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. 클라이언트에서 id값 받아오기
		String userId = request.getParameter("id");

		// 2. service객체 얻어오기
		IUserService service = UserServiceImpl.getInstance();

		// 3. 메소드 호출 - 컨트롤러-> dao -> xml 한 결과값 받아오기
		int res = service.deleteUpdate(userId);

		if (res > 0) {
			response.sendRedirect("./logout.jsp");
		} else {
			response.sendRedirect("./delete.do");
		}

	}

}
