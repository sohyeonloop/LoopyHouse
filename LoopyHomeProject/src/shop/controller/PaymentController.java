package shop.controller;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import comm.vo.NoticeVO;
import shop.service.IItemService;
import shop.service.IOrderService;
import shop.service.IPaymentService;
import shop.service.IProductService;
import shop.service.ItemServiceImpl;
import shop.service.OrderServiceImpl;
import shop.service.PaymentServiceImpl;
import shop.service.ProductServiceImpl;
import shop.vo.ItemVO;
import shop.vo.OrderVO;
import shop.vo.PaymentVO;
import shop.vo.ProductVO;


@WebServlet("/payment.do")
public class PaymentController extends HttpServlet {
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IPaymentService payService = PaymentServiceImpl.getinstance();
		IOrderService orderService = OrderServiceImpl.getinstance();
		IItemService itemService = ItemServiceImpl.getInstance();
		IProductService prodService = ProductServiceImpl.getInstance();
		String ordNo = request.getParameter("ord_no");
		String amount = request.getParameter("paid_amount");
		
		int payAmount = Integer.parseInt(amount);
		OrderVO ov = new OrderVO();
		PaymentVO pv = new PaymentVO();
		ItemVO iv = new ItemVO();
		ProductVO prov = new ProductVO();
		ov.setOrdNo(ordNo);
		ov.setOrdPrice(payAmount);
		pv.setOrdNo(ordNo);
		pv.setPayPrice(payAmount);
		
		iv.setOrdNo(ordNo);
		List<ItemVO> itemList = itemService.getOrdItem(iv);
		for(ItemVO item : itemList) {
			prov.setProdCode(item.getProdCode());
			prov.setProdSale(item.getItemQua());
			prodService.prodSaleUp(prov);
		}
		
		int cnt = payService.insertPayment(pv);
		int cnt2 = orderService.changeOrdStatus(ov);
		if(cnt+cnt2 > 1) {
			response.getWriter().write("yes");
		}else {
			response.getWriter().write("no");
		}
	}

}
