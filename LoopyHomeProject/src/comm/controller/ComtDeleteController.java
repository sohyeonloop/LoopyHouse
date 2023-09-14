package comm.controller;

import java.io.IOException;

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

@WebServlet("/comtDelete.do")
public class ComtDeleteController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String comtNo = req.getParameter("comtNo");
		String type = req.getParameter("type");
		int cnt = 0;
		if (type.equals("free")) {
			IFreeBoardService service = FreeBoardServiceImpl.getInstance();
			FreeComtVO fcmv = new FreeComtVO(comtNo);
			cnt = service.removeFreeComt(fcmv);

		} else if (type.equals("inq")) {
			IinqBoardService service = InqBoardServiceImpl.getInstance();
			InqComtVO icmv = new InqComtVO(comtNo);
			cnt = service.removeInqComt(icmv);
		}
		if (cnt > 0) {
			resp.getWriter().write("yes");
		} else {
			resp.getWriter().write("no");
		}

	}
}
