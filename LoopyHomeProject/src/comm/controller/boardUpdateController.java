package comm.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import comm.dao.NoticeBoardDaoImpl;
import comm.service.FreeBoardServiceImpl;
import comm.service.IFreeBoardService;
import comm.service.INoticeBoardService;
import comm.service.IinqBoardService;
import comm.service.InqBoardServiceImpl;
import comm.service.NoticeBoardServiceImpl;
import comm.vo.FreeBoardVO;
import comm.vo.FreeComtVO;
import comm.vo.InqBoardVO;
import comm.vo.InqComtVO;
import comm.vo.NoticeVO;

@WebServlet("/boardUpdate.do")
public class boardUpdateController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String boardStr = req.getParameter("board");
		String title = req.getParameter("title");
		String content = req.getParameter("content");

		
		if (boardStr.contains("\"freeNo\"")) {
			FreeBoardVO board = new Gson().fromJson(boardStr, FreeBoardVO.class);
			IFreeBoardService service = FreeBoardServiceImpl.getInstance();
			String[] arr = content.split("tomcatImg/");
			String imgName = "";
			int idx = arr[1].indexOf("\"");
			imgName = arr[1].substring(0, idx);
			board.setFreeTitle(title);
			board.setFreeContent(content);
			board.setFreeImage(imgName);
			service.modifyFreeBoard(board);
			resp.sendRedirect(req.getContextPath() + "/comm/free.do");
		} else if (boardStr.contains("\"inqNo\"")) {
			InqBoardVO board = new Gson().fromJson(boardStr, InqBoardVO.class);
			IinqBoardService service = InqBoardServiceImpl.getInstance();
			board.setInqTitle(title);
			board.setInqContent(content);
			service.modifyInqBoard(board);
			resp.sendRedirect(req.getContextPath() + "/comm/inquery.do");
		} else if (boardStr.contains("\"noticeNo\"")){
			NoticeVO board = new Gson().fromJson(boardStr, NoticeVO.class);
			INoticeBoardService service = NoticeBoardServiceImpl.getInstance();
			board.setNoticeTitle(title);
			board.setNoticeContent(content);
			service.modifyNotice(board);
			resp.sendRedirect(req.getContextPath() + "/comm/notice.do");
		}
	
	}
	
}
