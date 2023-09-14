package comm.dao;

import java.util.List;

import java.util.Map;

import comm.vo.NoticeVO;
import user.dao.MyBatisDao;

public class NoticeBoardDaoImpl extends MyBatisDao implements InoticeBoardDao{

	private static InoticeBoardDao dao;
	
	private NoticeBoardDaoImpl() {
		
	}

	public static InoticeBoardDao getInstance() {
		if(dao == null) dao = new NoticeBoardDaoImpl();
		return dao;
	}
	
	@Override
	public int countNBoard() {
		return selectOne("board.countNBoard");
	}

	@Override
	public List<NoticeVO> noticeBoardList(Map<String, Object> map) {
		return selectList("board.nBoardList",map);
	}

	@Override
	public int updateNotice(NoticeVO nv) {
		return update("board.updateNotice", nv);
	}

	@Override
	public int deleteNotice(NoticeVO nv) {
		return delete("board.deleteNotice", nv);
	}

	@Override
	public int insertNotice(NoticeVO nv) {
		return insert("board.insertNotice", nv);
	}

	@Override
	public int updateNoticeViews(NoticeVO nv) {
		return update("board.viewsNotice", nv);
	}

	@Override
	public List<NoticeVO> selectRecentNotice(int boardCount) {
		return selectList("board.recentNotice", boardCount);
	}


}
