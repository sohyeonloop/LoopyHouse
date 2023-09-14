

package comm.service;

import java.util.List;
import java.util.Map;

import comm.dao.FreeBoardDaoImpl;
import comm.dao.IFreeBoardDao;
import comm.vo.FreeAttachVO;
import comm.vo.FreeBoardVO;
import comm.vo.FreeComtVO;


public class FreeBoardServiceImpl implements IFreeBoardService {
	
	private IFreeBoardDao boardDao;
	private static IFreeBoardService boardService;
	
	private FreeBoardServiceImpl() {
		boardDao = FreeBoardDaoImpl.getInstance();
	}
	
	public static IFreeBoardService getInstance() {
		if(boardService == null) {
			boardService = new FreeBoardServiceImpl();
		}
		return boardService;
	}

	@Override
	public int countFBoardList() {
		return boardDao.countFBoardList();
	}

	@Override
	public List<FreeBoardVO> getAllFBoard(Map<String, Object> map) {
		return boardDao.getAllFBoard(map);
	}

	@Override
	public int registFreeBoard(FreeBoardVO fbv) {
		return boardDao.insertFreeBoard(fbv);
	}

	@Override
	public int modifyFreeBoard(FreeBoardVO fbv) {
		return boardDao.updateFreeBoard(fbv);
	}

	@Override
	public int removeFreeBoard(FreeBoardVO fbv) {
		return boardDao.deleteFreeBoard(fbv);
	}

	@Override
	public List<FreeComtVO> getListFreeComt(FreeComtVO fcmv) {
		return boardDao.getListFreeComt(fcmv);
	}

	@Override
	public int registFreeComt(FreeComtVO fcmv) {
		return boardDao.insertFreeComt(fcmv);
	}

	@Override
	public int modifyFreeComt(FreeComtVO fcmv) {
		return boardDao.updateFreeComt(fcmv);
	}

	@Override
	public int removeFreeComt(FreeComtVO fcmv) {
		return boardDao.deleteFreeComt(fcmv);
	}

	@Override
	public int increaseFreeViews(FreeBoardVO fbv) {
		return boardDao.updateFreeViews(fbv);
	}

	@Override
	public List<FreeBoardVO> getPopularFree(int boardCount) {
		return boardDao.selectPopularFree(boardCount);
	}

	@Override
	public List<FreeBoardVO> getRecentFree(int boardCount) {
		return boardDao.selectRecentFree(boardCount);
	}

	@Override
	public List<FreeBoardVO> searchFree(String searchText) {
		return boardDao.searchFree(searchText);
	}



}
