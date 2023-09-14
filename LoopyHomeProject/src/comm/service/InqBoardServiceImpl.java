package comm.service;

import java.util.List;

import java.util.Map;

import comm.dao.IinqBoardDao;
import comm.dao.InqBoardDaoImpl;
import comm.vo.InqBoardVO;
import comm.vo.InqComtVO;

public class InqBoardServiceImpl implements IinqBoardService {
	
	private IinqBoardDao inqDao;
	private static IinqBoardService inqService;
	
	private InqBoardServiceImpl() {
		inqDao = InqBoardDaoImpl.getInstance();
	}
		
	public static IinqBoardService getInstance() {
		if(inqService == null) inqService = new InqBoardServiceImpl();
		return inqService;
	}
		

	@Override
	public int countIBoard() {
		
		int countList = 0;
		
		countList = inqDao.countIBoard();

		return countList;
	}

	@Override
	public List<InqBoardVO> inqBoardList(Map<String, Object> map) {
		List<InqBoardVO> boardList = null;
		boardList = inqDao.inqBoardList(map);
		
		return boardList;
	}

	@Override
	public int registInqBoard(InqBoardVO ibv) {
		return inqDao.insertInqBoard(ibv);
	}

	@Override
	public int modifyInqBoard(InqBoardVO ibv) {
		return inqDao.updateInqBoard(ibv);
	}

	@Override
	public int removeInqBoard(InqBoardVO ibv) {
		return inqDao.deleteInqBoard(ibv);
	}

	@Override
	public List<InqComtVO> getListInqComt(InqComtVO icmv) {
		return inqDao.getListInqComt(icmv);
	}

	@Override
	public int registInqComt(InqComtVO icmv) {
		return inqDao.insertInqComt(icmv);
	}

	@Override
	public int modifyInqComt(InqComtVO icmv) {
		return inqDao.updateInqComt(icmv);
	}

	@Override
	public int removeInqComt(InqComtVO icmv) {
		return inqDao.deleteInqComt(icmv);
	}

	@Override
	public int increaseInqViews(InqBoardVO ibv) {
		return inqDao.updateInqViews(ibv);
	}

	@Override
	public List<InqBoardVO> getRecentInq(int boardCount) {
		return inqDao.selectRecentInq(boardCount);
	}


	
}
