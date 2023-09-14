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
import comm.service.IinqBoardService;
import comm.service.InqBoardServiceImpl;
import comm.vo.FreeBoardVO;
import comm.vo.FreeComtVO;
import comm.vo.InqBoardVO;
import comm.vo.InqComtVO;
import comm.vo.NoticeVO;

@WebServlet("/cmtUpdate.do")
public class ComtUpdateController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String comtStr = req.getParameter("comt");
		String content = req.getParameter("content");
		System.out.println(comtStr);
		if (comtStr.contains("\"freeCmNo\"")) {
			FreeComtVO comt = new Gson().fromJson(comtStr, FreeComtVO.class);
			IFreeBoardService service = FreeBoardServiceImpl.getInstance();
			comt.setFreeCmContent(content);
			int cnt = service.modifyFreeComt(comt);
			RequestDispatcher dispatcher = req.getRequestDispatcher("boardDetail.do");
			dispatcher.forward(req, resp);
		} else if (comtStr.contains("\"inqCmNo\"")) {
			InqComtVO comt = new Gson().fromJson(comtStr, InqComtVO.class);
			IinqBoardService service = InqBoardServiceImpl.getInstance();
			comt.setInqCmContent(req.getParameter("content"));
			int cnt = service.modifyInqComt(comt);
//			List<InqComtVO> commentList = service.getListInqComt(comt);
//			req.setAttribute("comment", commentList);
//			req.setAttribute("check", "inq");
			RequestDispatcher dispatcher = req.getRequestDispatcher("boardDetail.do");
			dispatcher.forward(req, resp);
		} 
	}
	
}
