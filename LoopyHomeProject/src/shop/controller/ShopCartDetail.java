package shop.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.service.IUserService;
import user.service.UserServiceImpl;
import user.vo.CustomerVO;

@WebServlet("/cartDetail.do")
public class ShopCartDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ShopCartDetail() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		//1. 클라이언트 전송요청시 전달데이터를 받는다
		String userId = request.getParameter("ordNum");
		
		// 2. service객체 얻기
		IUserService service = UserServiceImpl.getInstance();
		
		// 3. service메소드 호출하기 - id정보를 조회 결과값 받기
		CustomerVO cv = service.detailCostomer(userId);
		
		// 4. 결과값을 request에 저장하기
		request.setAttribute("cusInfo", cv);
		
		// 5. jsp -> 장바구니 내역 보여주기 
		request.getRequestDispatcher("/cusUpdate.jsp").forward(request, response);
	}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
