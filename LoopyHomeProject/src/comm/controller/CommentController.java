package comm.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comm.service.FreeBoardServiceImpl;
import comm.service.IFreeBoardService;
import comm.service.IinqBoardService;
import comm.service.InqBoardServiceImpl;
import comm.vo.FreeComtVO;
import comm.vo.InqComtVO;

@WebServlet("/comment.do")
public class CommentController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userId =  req.getParameter("userId");
		String type = req.getParameter("check");
		String content = req.getParameter("cmt");
		String boardNo = req.getParameter("boardNo");
		String boardStr = req.getParameter("board");
		System.out.println(boardStr+"이건가");
		if(type.equals("free")) {
			FreeComtVO fcmv = new FreeComtVO(userId,boardNo,content);
			IFreeBoardService service = FreeBoardServiceImpl.getInstance();
			service.registFreeComt(fcmv);
			
			RequestDispatcher rd = req.getRequestDispatcher("boardDetail.do");
			rd.forward(req, resp);
		}
		else if(type.equals("inq")) {
			InqComtVO icmv = new InqComtVO(userId,boardNo,content);
			IinqBoardService service = InqBoardServiceImpl.getInstance();
			service.registInqComt(icmv);
			
			RequestDispatcher rd = req.getRequestDispatcher("boardDetail.do");
			rd.forward(req, resp);
		}
		
		
		
	}

}
