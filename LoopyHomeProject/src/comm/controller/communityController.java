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

import comm.dao.InqBoardDaoImpl;
import comm.service.FreeBoardServiceImpl;
import comm.service.IFreeBoardService;
import comm.service.INoticeBoardService;
import comm.service.IinqBoardService;
import comm.service.InqBoardServiceImpl;
import comm.service.NoticeBoardServiceImpl;
import comm.vo.FreeBoardVO;
import comm.vo.InqBoardVO;
import comm.vo.NoticeVO;

@WebServlet("/community.do")
public class communityController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//정보 조회를 위한 서비스 객체 생성하기 
		IFreeBoardService freeBoardService = FreeBoardServiceImpl.getInstance();
		IinqBoardService inqBoardService = InqBoardServiceImpl.getInstance();
		INoticeBoardService noticeService = NoticeBoardServiceImpl.getInstance();
		//전체 글 갯수 조회하기
		int countFree = freeBoardService.countFBoardList();
		int countInq =  inqBoardService.countIBoard();
		int countNotice = noticeService.countNBoardList();
		
		//페이징 처리 및 범위 내 게시글 조회를 위한 공식 작성
		if(countFree > 5) {
			countFree = 5;
		}
		if(countInq > 5) {
			countInq = 5;
		}
		if(countNotice > 5) {
			countNotice = 5;
		}
		
		List<FreeBoardVO> freePopularList = freeBoardService.getPopularFree(countFree);
		List<FreeBoardVO> freeRecentList = freeBoardService.getRecentFree(countFree);
		List<InqBoardVO> inqRecentList = inqBoardService.getRecentInq(countInq);
		List<NoticeVO> notRecentList = noticeService.getRecentNotice(countNotice);
		
		//결과(boardList)를 request에 담아서 출력할 페이지로 전달 
		req.setAttribute("freePopular", freePopularList);
		req.setAttribute("freeRecent", freeRecentList);
		req.setAttribute("inqRecent", inqRecentList);
		req.setAttribute("notRecent", notRecentList);
		
		req.getRequestDispatcher("/communityMain.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
	
}
