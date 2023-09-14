package comm.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comm.service.FreeBoardServiceImpl;
import comm.service.IFreeBoardService;
import comm.service.IPopSearchService;
import comm.service.PopSearchServiceImpl;
import comm.vo.FreeBoardVO;
import shop.service.IProductService;
import shop.service.ProductServiceImpl;
import shop.vo.ProductVO;
import shop.vo.SearchVO;

@WebServlet("/search.do")
public class SearchController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		String searchText = null;
		if (req.getParameter("searchText") != null) {
			searchText = req.getParameter("searchText");
			System.out.println(searchText);
		}

		IProductService prodService = ProductServiceImpl.getInstance();
		IFreeBoardService freeService = FreeBoardServiceImpl.getInstance();

		List<ProductVO> prodList = prodService.searchProd(searchText);
		List<FreeBoardVO> freeList = freeService.searchFree(searchText);

		String srchCode = req.getParameter("searchText");

		SearchVO sv = new SearchVO();

		sv.setSchWord(srchCode);

		IPopSearchService service = PopSearchServiceImpl.getInstance();

		// schWord 존재하는지 확인
		boolean isExist = service.popSearchCheck(sv.getSchWord());

		if (isExist) {
			// schWord 존재할경우
			int upres = service.popSearchUpdate(sv);
		} else {

			int res = service.insertPopSearch(sv);
		}

		// 인기순위 10까지 정렬
		List<SearchVO> searchLank = service.popSearchSelect();

		req.setAttribute("popSearch", searchLank);

		req.setAttribute("prodList", prodList);
		req.setAttribute("freeList", freeList);
		System.out.println(req.getContextPath()+"주소 확인용");
		RequestDispatcher dispatcher = req.getRequestDispatcher("/allSearch.jsp");
		dispatcher.forward(req, resp);

	}
}
