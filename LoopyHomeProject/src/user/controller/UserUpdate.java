package user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import user.service.IUserService;
import user.service.UserServiceImpl;
import user.vo.CustomerVO;

@MultipartConfig
@WebServlet("/update.do")
public class UserUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserUpdate() {
        super();
    }

    //doget에서 하는일 : 수정폼을 만들기 위해서 id값에 대한 정보를 조회
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//1. 클라이언트 전송요청시 전달데이터를 받는다
		String userId = request.getParameter("id");
		
		// 2. service객체 얻기
		IUserService service = UserServiceImpl.getInstance();
		
		// 3. service메소드 호출하기 - id정보를 조회 결과값 받기
		CustomerVO cv = service.detailCostomer(userId);
		
		// 4. 결과값을 request에 저장하기
		request.setAttribute("cusInfo", cv);
		
		// 5. jsp 로 이동
		request.getRequestDispatcher("/cusUpdate.jsp").forward(request, response);
		
	}
	
	
	//dopost하는일 : 수정항목을 수정폼에서 입력하고 그 값을 받아서 db에 저장 
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		//입력한 값 가져오기
		String custId = request.getParameter("custId");
		String custName = request.getParameter("custName");
		String custNickName = request.getParameter("custNickName");
		String custTel = request.getParameter("custTel");
		String custPwd = request.getParameter("custPwd");
		String custMail = request.getParameter("custMail");
		String custGender = request.getParameter("custGender");
		String custBirth = request.getParameter("custBirth");
		
		Part part = request.getPart("custPhoto");
		
		String fileName = this.getFilename(part);
		System.out.println("fileName=" + fileName);
		
		//vo에 입력한 값들을 저장
		CustomerVO cv = new CustomerVO();
		cv.setCustId(custId);
		cv.setCustName(custName);
		cv.setCustNickName(custNickName);
		cv.setCustTel(custTel);
		cv.setCustPwd(custPwd);
		cv.setCustMail(custMail);
		cv.setCustGender(custGender);
		cv.setCustBirth(custBirth);
		cv.setCustPhoto(fileName);
		
		//service 객체 얻기
		IUserService service = UserServiceImpl.getInstance();
		
		//service 메소드 호출 결과값 
		int res = service.updateCustomer(cv);
		
		if( res > 0) {
			response.sendRedirect("./mypage.do?id=" + custId );
		}else {
			response.sendRedirect("./update.do?id=" + custId);
		}
		
	}
	
	
	private String getFilename(Part part) {

		String contentDisp = part.getHeader("content-disposition");
		System.out.println("contentDisp=" + contentDisp);

		String[] split = contentDisp.split(";");
		for (int i = 0; i < split.length; i++) {
			String temp = split[i];
			System.out.println("temp=" + temp);

			if (temp.trim().startsWith("filename")) {
				return temp.substring(temp.indexOf("=") + 2, temp.length() - 1);
			}
		}
		return ""; // getFilename끝
	}


}
