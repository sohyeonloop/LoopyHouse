package comm.dao;

import java.util.List;
import java.util.Map;

import comm.vo.InqAttachVO;
import comm.vo.InqBoardVO;
import comm.vo.InqComtVO;
import user.dao.MyBatisDao;

public class InqBoardDaoImpl extends MyBatisDao implements IinqBoardDao{

	private static IinqBoardDao dao;
	
	private InqBoardDaoImpl() {
		
	}

	public static IinqBoardDao getInstance() {
		if(dao == null) dao = new InqBoardDaoImpl();
		return dao;
	}
	
	@Override
	public int countIBoard() {
		return selectOne("board.countIBoard");
	}

	@Override
	public List<InqBoardVO> inqBoardList(Map<String, Object> map) {
		return selectList("board.iBoardList",map);
	}

	@Override
	public int insertInqBoard(InqBoardVO ibv) {
		return insert("board.insertInqBoard", ibv);
	}
	

	@Override
	public int updateInqBoard(InqBoardVO ibv) {
		return update("board.updateInqBoard", ibv);
	}

	@Override
	public int deleteInqBoard(InqBoardVO ibv) {
		return delete("board.deleteInqBoard", ibv);
	}

	@Override
	public List<InqComtVO> getListInqComt(InqComtVO icmv) {
		return selectList("board.getListInqComt", icmv);
	}

	@Override
	public int insertInqComt(InqComtVO icmv) {
		return insert("board.insertInqComt", icmv);
	}

	@Override
	public int updateInqComt(InqComtVO icmv) {
		return update("board.updateInqComt", icmv);
	}

	@Override
	public int deleteInqComt(InqComtVO icmv) {
		return delete("board.deleteInqComt", icmv);
	}

	@Override
	public int updateInqViews(InqBoardVO ibv) {
		return update("board.viewsInq", ibv);
	}

	@Override
	public List<InqBoardVO> selectRecentInq(int boardCount) {
		return selectList("board.recentInq", boardCount);
	}
	
	


}
