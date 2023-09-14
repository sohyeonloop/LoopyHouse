package shop.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.service.IWishlistService;
import shop.service.WishlistServiceImpl;
import shop.vo.WishListVO;

@WebServlet("/wishlistDlt.do")
public class WishListDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public WishListDeleteController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String cusId = (String) request.getSession().getAttribute("custId");
		String prodCode = request.getParameter("pcode");

		WishListVO wv = new WishListVO();

		wv.setCustId(cusId);
		wv.setProdCode(prodCode);

		IWishlistService service = WishlistServiceImpl.getInstance();

		int res = service.deleteWish(wv);

		response.sendRedirect("./mypage.do?id=" + cusId);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
