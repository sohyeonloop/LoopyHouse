package comm.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import comm.service.FreeBoardServiceImpl;
import comm.service.IFreeBoardService;
import comm.service.INoticeBoardService;
import comm.service.IinqBoardService;
import comm.service.InqBoardServiceImpl;
import comm.service.NoticeBoardServiceImpl;
import comm.vo.FreeAttachVO;
import comm.vo.FreeBoardVO;
import comm.vo.InqAttachVO;
import comm.vo.InqBoardVO;
import comm.vo.NoticeVO;

@WebServlet("/board.do")
public class boardController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String content = req.getParameter("content");
		
		String userId = req.getParameter("userId");
		String title = req.getParameter("title");
		
		if(req.getParameter("board").equals("free")) {
			String[] arr = content.split("tomcatImg/");
			String imgName = "";
			int idx = arr[1].indexOf("\"");
			imgName = arr[1].substring(0, idx);
			IFreeBoardService freeService = FreeBoardServiceImpl.getInstance();
			FreeBoardVO fbv = new FreeBoardVO(userId, title, content, imgName);
			int brdcnt = freeService.registFreeBoard(fbv);
			resp.sendRedirect(req.getContextPath() + "/comm/free.do");
		}
		else if(req.getParameter("board").equals("inq")) {
			IinqBoardService inqService = InqBoardServiceImpl.getInstance();
			InqBoardVO ibv = new InqBoardVO(userId,title,content);
			int cnt = inqService.registInqBoard(ibv);
			
			resp.sendRedirect(req.getContextPath() + "/comm/inquery.do");
		}
		
		else if(req.getParameter("board").equals("not")) {
			INoticeBoardService notService = NoticeBoardServiceImpl.getInstance();
			NoticeVO nv = new NoticeVO(userId,title,content);
			int cnt = notService.registNotice(nv);
			
			resp.sendRedirect(req.getContextPath() + "/comm/notice.do");
		}
	}
	
	
	
}
