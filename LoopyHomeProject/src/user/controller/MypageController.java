package user.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.service.IMypageService;
import user.service.IUserService;
import user.service.MypageServiceImpl;
import user.service.UserServiceImpl;
import user.vo.CustomerVO;

@WebServlet("/mypage.do")
public class MypageController extends HttpServlet {
   private static final long serialVersionUID = 1L;

   public MypageController() {
      super();
   }

   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      // 1. 클라이언트의 전송요청시 전달데이터를 받는다 - id
      String userId = request.getParameter("id");

      // 2. service 객체 얻기
      IUserService service = UserServiceImpl.getInstance();
      IMypageService mypageService = MypageServiceImpl.getInstance();

      // 3. service메소드 호출 - 결과값받기
      //회원정보 관리 
      CustomerVO cv = service.detailCostomer(userId);
      
      
      //주문목록 조회
      List<HashMap<String, Object>> hsrst = mypageService.selectOrder(userId);
     
      
      //위시리스트 조회
      List<HashMap<String, Object>> wish = mypageService.selectWish(userId);

      
      
      
      


      // 4. 결과값을 request에 저장
      request.setAttribute("cusVo", cv);
      
      request.setAttribute("hsRst", hsrst);

      
      request.setAttribute("wish", wish);

      // 5. jsp로 이동
      request.getRequestDispatcher("/mypage.jsp").forward(request, response);
      
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
   }

}