package shop.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.OrderedBidiMap;

import shop.service.IItemService;
import shop.service.IOrderService;
import shop.service.ItemServiceImpl;
import shop.service.OrderServiceImpl;
import shop.vo.ItemVO;
import shop.vo.OrderVO;

@WebServlet("/cartAdd.do")
public class ProductDetailCartAddController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IItemService itemService = ItemServiceImpl.getInstance();
		IOrderService orderService = OrderServiceImpl.getinstance();
		
		ItemVO iv = new ItemVO();
		OrderVO ov = new OrderVO();

		String ordNo = req.getParameter("ordNo");
		String prodCode = req.getParameter("prodCode");
		int itemQua = Integer.parseInt(req.getParameter("itemQua"));
//		int ordPrice = Integer.parseInt(req.getParameter("ordPrice"));
//		int ordQua;
//		if(req.getParameter("ordQua") != null) {
//			ordQua = Integer.parseInt(req.getParameter("ordQua"));;
//		} else {
//			ordQua = 1;
//		}
		String custId = req.getParameter("custId");
		String itemColor = req.getParameter("itemColor");
		
		System.out.println("prodCode:"+prodCode);
		ov.setCustId(custId);
		// OrderNo ord에 담김
		OrderVO ord = orderService.orderNoCheck(ov);
		System.out.println(ord);
		if(ord.getOrdNo().equals("0")) {
			//없으면 오더넘버 생성
			orderService.addOrder(ov);
			ord = orderService.orderNoCheck(ov);
		}
		
		iv.setOrdNo(ord.getOrdNo());
		iv.setProdCode(prodCode);
		
		//장바구니 테이블에 상품이 이미 있는지 없는지 체크
		int check = orderService.ordNoProdCheck(iv);
		int cnt = 0;
		if(check > 0) { // item 테이블 업데이트	
			iv.setItemQua(itemQua);
			cnt = itemService.updateQty(iv);
		}else { //item 테이블 추가
			iv.setItemColor(itemColor);
			iv.setItemQua(itemQua);
			cnt = itemService.addCart(iv);
		}
		
		if(cnt > 0) {
			resp.getWriter().print(1);
		} else {
			resp.getWriter().print(0);
		}
		
//		if(orderNum.equals("0")) {
//			orderService.addOrder(ov);
//			orderNum = String.valueOf(orderService.orderNoCheck(ov));
//			iv.setOrdNo(orderNum);
//			iv.setItemColor(itemColor);
//			iv.setItemQua(itemQua);
//			iv.setProdCode(prodCode);
//		}
//		int cntInsert;
//		
//		//고객의 가장 최근 주문번호 확인
//		int orderChk = itemService.ordNoCheck(ordNo);
		
		
//		if(orderChk == 0) { //주문번호가 없으면 새로 추가
//			
//			ov.setCustId(custId);
//			int cnt = orderService.addOrder(ov);
//			orderNum = String.valueOf(orderService.ordNoProdCheck(iv));
//			iv.setOrdNo(orderNum);
//			iv.setProdCode(prodCode);
//			iv.setItemColor(itemColor);
//			iv.setItemQua(itemQua);
//			int prodNo = itemService.addCart(iv);
//			resp.getWriter().write(prodNo);
//			
//		} else { //주문번호가 있으면 수량 업데이트
//			iv.setOrdNo(orderNum);
//			
//			int cntUpdate = 0;
//			cntUpdate = itemService.updateQty(iv);
//			
//			cntInsert = 0;
//			
//			if(cntUpdate==0) {
//				cntInsert = itemService.addCart(iv);
//			}
//			
//			if(cntUpdate>0 || cntInsert >0) {
//				resp.getWriter().print(1);
//			} else {
//				resp.getWriter().print(0);
//			}
//		}
	}
	
	
}
