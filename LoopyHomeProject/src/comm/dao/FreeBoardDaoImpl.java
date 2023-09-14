package comm.dao;

import java.util.List;
import java.util.Map;

import comm.vo.FreeAttachVO;
import comm.vo.FreeBoardVO;
import comm.vo.FreeComtVO;
import user.dao.MyBatisDao;

public class FreeBoardDaoImpl extends MyBatisDao implements IFreeBoardDao{
	
	private static IFreeBoardDao boardDao;
	private FreeBoardDaoImpl() {}
	
	public static IFreeBoardDao getInstance() {
		if(boardDao == null) {
			boardDao = new FreeBoardDaoImpl();
		}
		return boardDao;
	}

	@Override
	public int countFBoardList() {
		int cnt = 0;
		cnt = selectOne("board.countFBoard");
		return cnt;
	}

	@Override
	public List<FreeBoardVO> getAllFBoard(Map<String, Object> map) {
		return selectList("board.fBoardList",map);
	}

	

	@Override
	public int insertFreeBoard(FreeBoardVO fbv) {
		return insert("board.insertFreeBoard", fbv);
	}


	@Override
	public int updateFreeBoard(FreeBoardVO fbv) {
		
		return update("board.updateFreeBoard",fbv);
	}

	@Override
	public int deleteFreeBoard(FreeBoardVO fbv) {
		
		return delete("board.deleteFreeBoard",fbv);
	}

	@Override
	public List<FreeComtVO> getListFreeComt(FreeComtVO fcmv) {

		return selectList("board.getListFreeComt",fcmv);
	}

	@Override
	public int insertFreeComt(FreeComtVO fcmv) {
		return insert("board.insertFreeComt", fcmv);
	}

	@Override
	public int updateFreeComt(FreeComtVO fcmv) {
		return update("board.updateFreeComt", fcmv);
	}

	@Override
	public int deleteFreeComt(FreeComtVO fcmv) {
		
		return delete("board.deleteFreeComt", fcmv);
	}

	@Override
	public int updateFreeViews(FreeBoardVO fbv) {
		return update("board.viewsFree",fbv);
	}

	@Override
	public List<FreeBoardVO> selectPopularFree(int boardCount) {
		return selectList("board.popularFree", boardCount);
	}

	@Override
	public List<FreeBoardVO> selectRecentFree(int boardCount) {
		return selectList("board.recentFree", boardCount);
	}

	@Override
	public List<FreeBoardVO> searchFree(String searchText) {
		List<FreeBoardVO> schList = selectList("user.searchFree", searchText);
		return schList;
	}
	
}
