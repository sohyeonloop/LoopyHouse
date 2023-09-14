package comm.controller;

import java.io.IOException;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comm.service.INoticeBoardService;
import comm.service.NoticeBoardServiceImpl;
import comm.vo.NoticeVO;

/**
 * Servlet implementation class InqBoardController
 */
@WebServlet("/comm/notice.do")
public class NoticeBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NoticeBoardController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//게시판 글 조회
				//지정된 범위 내의 게시글 조회 -> 페이징 처리 정보 같이 생성 
				
				//현재 페이지 지정 defalut 1
				int currentPage =1; 
				
				currentPage = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
				
				//정보 조회를 위한 서비스 객체 생성하기 
				INoticeBoardService service = NoticeBoardServiceImpl.getInstance();
				//전체 글 갯수 조회하기
				int countList = service.countNBoardList();
//				System.out.println("전체글 갯수 : " + countList);
				
				//페이징 처리 및 범위 내 게시글 조회를 위한 공식 작성
				                                    
				//한 화면에 출력할 글 갯수
				int perPage = 5;
				
				//한 페이지에 출력할 글 갯수
				int perList = 10;
				
				//전체 페이지 수 구하기 - 전체 글 갯수(countList) / 페이지 당 글 갯수(perList) 
				int totalPage = (int)Math.ceil((double)countList / (double)perList);
				System.out.println("전체 페이지 수 :::: " + totalPage );
				
				
				//페이지에 표시할 게시글의 범위(start ~ end) 구하기
				//start = (currentPage-1)*perList + 1;
				//1페이지 일때 : (1-1)*5+1 => 1
				//2페이지 일때 : (2-1)*5+1 => 6
				//3페이지 일때 : (3-1)*5+1 => 11
				int start = (currentPage -1) * perList + 1;
				
				//end = start + perList - 1;
				//1페이지일때 : 1+2-1 => 2
				//3페이지일때 : 3+2-1 => 4
				//5페이지일때 : 5+2-1 => 6
				//7페이지일때 : 7+2-1 => 8 => 실제 데이터 보다 넘치는 값이 계산된 경우 
				int end = start + perList -1; 
				if(end > countList) end = countList; //오버된 값을 내가 가진 최대값으로 치환 
				
				
				//페이지 처리할 startPage ~ endPage 값 구하기 
				//startPage = (currentPage - 1)(perPage * perPage) +1;
				//1페이지 일때 : ((1-1)/2*2)+1 ==> 1
				//2페이지 일때 : ((2-1)/2*2)+1 ==> 1
				//3페이지 일때 : ((3-1)/2*2)+1 ==> 3
				//5페이지 일때 : ((3-1)/2*2)+1 ==> 5
				//6페이지 일때 : ((3-1)/2*2)+1 ==> 5
				int startPage = ((currentPage - 1)/perPage * perPage) + 1;
				System.out.println("startPage(curr3일째)>>>" + startPage);
				
				//endPage = startPage + perPage -1; 
				//1페이지 일때 : 1+ 3 -1 =3;
				//3페이지 일때 : 3+ 2 -1 =4;
				//★5페이지 일때 : 5+ 2 -1 =6;
				//7페이지 일때 : 7+ 2 -1 =8;
				int endPage = startPage + perPage - 1; 
				if(endPage > totalPage) endPage = totalPage;
				
				//서비스객체 - board관련 service객체 땡겨쓰기
				//범위 별 게시글 조회하기 
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("start", start);
				map.put("end", end);
				List<NoticeVO> boardList = service.getAllNBoard(map);
				
				//결과(boardList)를 request에 담아서 출력할 페이지로 전달 
				request.setAttribute("list", boardList);
				
				
				//페이징 처리를 위한 정보도 request에 담아서 전달하기
				request.setAttribute("sPage", startPage);
				request.setAttribute("ePage", endPage);
				request.setAttribute("tPage", totalPage);
				request.setAttribute("cPage", currentPage);
				

				
				request.getRequestDispatcher("/notice").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
