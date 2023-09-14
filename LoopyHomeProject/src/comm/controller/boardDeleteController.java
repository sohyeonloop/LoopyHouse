package comm.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import comm.service.FreeBoardServiceImpl;
import comm.service.IFreeBoardService;
import comm.service.INoticeBoardService;
import comm.service.IinqBoardService;
import comm.service.InqBoardServiceImpl;
import comm.service.NoticeBoardServiceImpl;
import comm.vo.FreeBoardVO;
import comm.vo.InqBoardVO;
import comm.vo.NoticeVO;

@WebServlet("/boardDelete.do")
public class boardDeleteController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String boardStr = req.getParameter("board");
		
		if (boardStr.contains("\"freeNo\"")) {
			FreeBoardVO board = new Gson().fromJson(boardStr, FreeBoardVO.class);
			IFreeBoardService service = FreeBoardServiceImpl.getInstance();
			service.removeFreeBoard(board);
			resp.sendRedirect(req.getContextPath() + "/comm/free.do");
		} else if (boardStr.contains("\"inqNo\"")) {
			InqBoardVO board = new Gson().fromJson(boardStr, InqBoardVO.class);
			IinqBoardService service = InqBoardServiceImpl.getInstance();
			service.removeInqBoard(board);
			resp.sendRedirect(req.getContextPath() + "/comm/inquery.do");
		} else if (boardStr.contains("\"noticeNo\"")){
			NoticeVO board = new Gson().fromJson(boardStr, NoticeVO.class);
			INoticeBoardService service = NoticeBoardServiceImpl.getInstance();
			service.removeNotice(board);
			resp.sendRedirect(req.getContextPath() + "/comm/notice.do");
		}
	
	}
	
}
