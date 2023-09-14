package user.controller;

import java.io.File;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import shop.service.IProductService;
import shop.service.ProductServiceImpl;
import shop.vo.ProductVO;

@MultipartConfig
@WebServlet("/prodRegist.do")
public class ProductRegistController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IProductService prodService = ProductServiceImpl.getInstance();
		String prodName = req.getParameter("prodName");
		System.out.println(prodName);
		System.out.println(req.getParameter("prodPrice")+"가격 확인용");
		int prodPrice = Integer.parseInt(req.getParameter("prodPrice"));
		String cateCode = req.getParameter("cateCode");
		String prodColor = req.getParameter("prodColor");
		
		String uploadPath = "D:/2.work/2.Highjava/LoopyHomeProject/WebContent/images";
		Part thumbnail = req.getPart("thumbnailFile");
		Part detail = req.getPart("detailFile");
		String thumbnailName = thumbnail.getSubmittedFileName();
		String detailName = detail.getSubmittedFileName();
		System.out.println(thumbnailName+"사진이름 확인1");
		System.out.println(detailName+"사진이름 확인2");
		String saveFilePath = ""; // 저장파일경로
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		if (thumbnailName != null && !thumbnailName.equals("")) { // 파일인 경우
			saveFilePath = uploadPath + "/" + thumbnailName;
			thumbnail.write(saveFilePath);
			thumbnail.delete(); 
		}
		if(detailName != null && !detailName.equals("")) {
			saveFilePath = uploadPath + "/" + detailName;
			detail.write(saveFilePath);
			detail.delete(); 
		}
		
		List<ProductVO> CodeList = prodService.getAllProdCode();
		ArrayList<Integer> prodCodeList = new ArrayList<>();  
		for(ProductVO pCode : CodeList) {
			String code = pCode.getProdCode();
			String[] codeArr = code.split("prod");
			prodCodeList.add(Integer.valueOf(codeArr[1]));
		}
		int max = Collections.max(prodCodeList) + 1;
		System.out.println("Max값 확인용"+ max);
		String prodCode = "";
		if(max>99) {
			prodCode = "prod" + String.valueOf(max);
		}else if(max>9) {
			prodCode = "prod0" + String.valueOf(max);
		}else {
			prodCode = "prod00" + String.valueOf(max);
		}
		
		
		
		ProductVO pv = new ProductVO(prodCode,prodName,prodPrice,cateCode,prodColor,thumbnailName,detailName);
		prodService.registProd(pv);
		req.setAttribute("check", "yes");
		req.getRequestDispatcher("/admin.do").forward(req, resp);

	}
	
}
