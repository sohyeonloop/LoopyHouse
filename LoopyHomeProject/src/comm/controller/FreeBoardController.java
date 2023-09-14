package comm.controller;

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

import comm.service.FreeBoardServiceImpl;
import comm.service.IFreeBoardService;
import comm.vo.FreeAttachVO;
import comm.vo.FreeBoardVO;

@WebServlet("/comm/free.do")
public class FreeBoardController extends HttpServlet{
	
	public FreeBoardController() {
        super();
    }
	
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//게시판 글 조회
		//지정된 범위 내의 게시글 조회 -> 페이징 처리 정보 같이 생성 
		
		//현재 페이지 지정 defalut 1
		int currentPage = 1; 
		
		currentPage = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		
		//정보 조회를 위한 서비스 객체 생성하기 
		IFreeBoardService boardService = FreeBoardServiceImpl.getInstance();
		//전체 글 갯수 조회하기
		int countList = boardService.countFBoardList();
//		System.out.println("전체글 갯수 : " + countList);
		
		//페이징 처리 및 범위 내 게시글 조회를 위한 공식 작성
		                                    
		//한 화면에 출력할 글 갯수
		int perPage = 5;
		
		//한 페이지에 출력할 글 갯수
		int perList = 12;
		
		//전체 페이지 수 구하기 - 전체 글 갯수(countList) / 페이지 당 글 갯수(perList) 
		int totalPage = (int)Math.ceil((double)countList / (double)perList);
		System.out.println("전체 페이지 수 :::: " + totalPage );
		
		
		int start = (currentPage -1) * perList + 1;
		
		int end = start + perList -1; 
		if(end > countList) end = countList; //오버된 값을 내가 가진 최대값으로 치환 
		
		int startPage = ((currentPage - 1)/perPage * perPage) + 1;
		System.out.println("startPage(curr3일째)>>>" + startPage);
		
		int endPage = startPage + perPage - 1; 
		if(endPage > totalPage) endPage = totalPage;
		
		Map<String, Object> startEnd = new HashMap<String, Object>();
		startEnd.put("start", start);
		startEnd.put("end", end);
		List<FreeBoardVO> boardList = boardService.getAllFBoard(startEnd);

		
		//결과(boardList)를 request에 담아서 출력할 페이지로 전달 
		request.setAttribute("boardList", boardList);
		
		
		
		//페이징 처리를 위한 정보도 request에 담아서 전달하기
		request.setAttribute("sPage", startPage);
		request.setAttribute("ePage", endPage);
		request.setAttribute("tPage", totalPage);
		request.setAttribute("cPage", currentPage);
		
		request.getRequestDispatcher("/free").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
