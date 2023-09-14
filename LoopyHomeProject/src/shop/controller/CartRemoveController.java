package shop.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.service.IItemService;
import shop.service.ItemServiceImpl;
import shop.vo.ItemVO;

@WebServlet("/removeCart.do")
public class CartRemoveController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IItemService itemService = ItemServiceImpl.getInstance();
		String value = req.getParameter("value");
		String[] valueArr = value.split(",");
		
		ItemVO item = new ItemVO();
		item.setProdCode(valueArr[0]);
		item.setOrdNo(valueArr[1]);
		int cnt = itemService.deleteItems(item);
		if(cnt>0) {
			resp.getWriter().write("yes");
		}
		
	}
	
	
}

