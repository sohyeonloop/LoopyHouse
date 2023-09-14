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

@WebServlet("/boardDetail.do")
public class boardDetailController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			String boardStr = req.getParameter("board");
		if (boardStr.contains("\"freeNo\"")) {
			FreeBoardVO board = new Gson().fromJson(boardStr, FreeBoardVO.class);
			FreeComtVO comment = new FreeComtVO();
			IFreeBoardService service = FreeBoardServiceImpl.getInstance();
			comment.setFreeNo(board.getFreeNo());
			List<FreeComtVO> commentList = service.getListFreeComt(comment);
			req.setAttribute("comment", commentList);
			req.setAttribute("check", "free");
			req.setAttribute("board",board);
			service.increaseFreeViews(board);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/freeDetail");
			dispatcher.forward(req, resp);
		} else if (boardStr.contains("\"inqNo\"")) {
			InqBoardVO board = new Gson().fromJson(boardStr, InqBoardVO.class);
			InqComtVO comment = new InqComtVO();
			IinqBoardService service = InqBoardServiceImpl.getInstance();
			comment.setInqNo(board.getInqNo());
			List<InqComtVO> commentList = service.getListInqComt(comment);
			req.setAttribute("comment", commentList);
			req.setAttribute("check", "inq");
			req.setAttribute("board",board);
			service.increaseInqViews(board);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/inqDetail");
			dispatcher.forward(req, resp);
		} else if (boardStr.contains("\"noticeNo\"")){
			NoticeVO board = new Gson().fromJson(boardStr, NoticeVO.class);
			req.setAttribute("check", "not");
			req.setAttribute("board",board);
			INoticeBoardService service = NoticeBoardServiceImpl.getInstance();
			service.increaseNoticeViews(board);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/notDetail");
			dispatcher.forward(req, resp);
		}
	
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
