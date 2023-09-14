package user.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import comm.service.INoticeBoardService;
import comm.service.NoticeBoardServiceImpl;
import comm.vo.BlackListVO;
import comm.vo.FreeBoardVO;
import comm.vo.NoticeVO;
import shop.service.IProductService;
import shop.service.ProductServiceImpl;
import shop.vo.ProductVO;
import user.dao.IUserDao;
import user.service.IUserService;
import user.service.UserServiceImpl;
import user.vo.CustomerVO;

@WebServlet("/admin.do")
public class AdminController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IUserService service = UserServiceImpl.getInstance();
		IProductService prodService = ProductServiceImpl.getInstance();  
		List<CustomerVO> decCustList = service.getDecNumCustomer();
		List<BlackListVO> blackList = service.selectAllBlackList();
		req.setAttribute("decCust", decCustList);
		req.setAttribute("blackList", blackList);
		
		ProductVO pv = new ProductVO();
		pv.setCateCode("F001");
		List<ProductVO> furnitureList = prodService.getAllCateProd(pv);
		System.out.println(furnitureList.size()+"가구 사이즈 확인");
		pv.setCateCode("CE001");
		List<ProductVO> digitalList = prodService.getAllCateProd(pv);
		pv.setCateCode("D001");
		List<ProductVO> decoList = prodService.getAllCateProd(pv);
		pv.setCateCode("L001");
		List<ProductVO> lightList = prodService.getAllCateProd(pv);
		pv.setCateCode("DS001");
		List<ProductVO> dailyList = prodService.getAllCateProd(pv);
		pv.setCateCode("K001");
		List<ProductVO> kitchenList = prodService.getAllCateProd(pv);

		req.setAttribute("furniture", furnitureList);
		req.setAttribute("digital", digitalList);
		req.setAttribute("deco", decoList);
		req.setAttribute("light", lightList);
		req.setAttribute("daily", dailyList);
		req.setAttribute("kitchen", kitchenList);
		req.setAttribute("decCust", decCustList);
		req.setAttribute("blackList", blackList);
		
		INoticeBoardService noticeService = NoticeBoardServiceImpl.getInstance();
		List<NoticeVO> notice = noticeService.getRecentNotice(10);
		req.setAttribute("notice", notice);
		
		req.getRequestDispatcher("/adminPage.jsp").forward(req, resp);
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if((String)req.getAttribute("check")=="yes") {
			doGet(req,resp);
		}
		else {
		String decStr = req.getParameter("decCust");
		IUserService service = UserServiceImpl.getInstance();
		IProductService prodService = ProductServiceImpl.getInstance();  
		HttpSession session = req.getSession();
		CustomerVO decCust = new Gson().fromJson(decStr, CustomerVO.class);
		String mngId = (String) session.getAttribute("mngId");
		String custId = decCust.getCustId();
		BlackListVO black = new BlackListVO(custId,mngId);
		
		service.registBlackList(black);
		service.deleteUpdate(custId);
		List<CustomerVO> decCustList = service.getDecNumCustomer();
		List<BlackListVO> blackList = service.selectAllBlackList();
		ProductVO pv = new ProductVO();
		pv.setProdCode("F001");
		List<ProductVO> furnitureList = prodService.getAllCateProd(pv);
		System.out.println(furnitureList.size()+"가구 사이즈 확인");
		pv.setProdCode("CE001");
		List<ProductVO> digitalList = prodService.getAllCateProd(pv);
		pv.setProdCode("D001");
		List<ProductVO> decoList = prodService.getAllCateProd(pv);
		pv.setProdCode("L001");
		List<ProductVO> lightList = prodService.getAllCateProd(pv);
		pv.setProdCode("DS001");
		List<ProductVO> dailyList = prodService.getAllCateProd(pv);
		pv.setProdCode("K001");
		List<ProductVO> kitchenList = prodService.getAllCateProd(pv);
		
		req.setAttribute("furniture", furnitureList);
		req.setAttribute("digital", digitalList);
		req.setAttribute("deco", decoList);
		req.setAttribute("light", lightList);
		req.setAttribute("daily", dailyList);
		req.setAttribute("kitchen", kitchenList);
		req.setAttribute("decCust", decCustList);
		req.setAttribute("blackList", blackList);
		
		INoticeBoardService noticeService = NoticeBoardServiceImpl.getInstance();
		List<NoticeVO> notice = noticeService.getRecentNotice(7);
		req.setAttribute("notice", notice);
		
		req.getRequestDispatcher("/adminPage.jsp").forward(req, resp);
		}
		
		
	}

}
