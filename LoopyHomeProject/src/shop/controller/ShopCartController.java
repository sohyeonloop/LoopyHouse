package shop.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shop.service.IItemService;
import shop.service.IOrderService;
import shop.service.IProductService;
import shop.service.ItemServiceImpl;
import shop.service.OrderServiceImpl;
import shop.service.ProductServiceImpl;
import shop.vo.ItemVO;
import shop.vo.OrderVO;
import shop.vo.ProductVO;

@WebServlet("/shopCart.do")
public class ShopCartController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IItemService itemService = ItemServiceImpl.getInstance();
		IProductService productService = ProductServiceImpl.getInstance();
		IOrderService orderService = OrderServiceImpl.getinstance();
		HttpSession session = req.getSession();
	    String custId = (String)session.getAttribute("custId");
	    OrderVO ord = new OrderVO();
	    ord.setCustId(custId);
	    // 회원 오더넘버 가져오기
	    ord = orderService.orderNoCheck(ord);
	    String check = ord.getOrdNo();
	    if(check==null || check.equals("")) { //결제가 안된 오더넘버가 없는지 확인
	    	OrderVO ov = new OrderVO();
	    	ov.setCustId(custId);
	    	orderService.addOrder(ov);
	    	ord = orderService.orderNoCheck(ord);
	    }
	    // 오더넘버로 장바구니 조회
	    String ordNo = ord.getOrdNo();
	    ItemVO iv = new ItemVO();
	    ProductVO pv = new ProductVO();
	    iv.setOrdNo(ordNo);
	    List<ItemVO> cartList = itemService.selectItems(iv);
	    List<ProductVO> prodList = new ArrayList<ProductVO>();
	    Map<String, Integer> itemMap = new HashMap<>();
	    int totalPrice = 0;
	    //가격 및 상품정보 가져옴
	    for(ItemVO item : cartList) {
	    	int qua = item.getItemQua();
	    	String code = item.getProdCode();
	    	pv.setProdCode(code);
	    	ProductVO product = productService.getProdPrice(pv);
	    	prodList.add(product);
	    	int price = product.getProdPrice();
	    	price = qua * price;
	    	totalPrice += price;
	    	itemMap.put(code,price);	
	    }
	    req.setAttribute("total", totalPrice);
	    req.setAttribute("itemMap", itemMap);
	    req.setAttribute("prodList", prodList);
	    req.setAttribute("cartList", cartList);
	    
	    req.getRequestDispatcher("/shopCart.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}
