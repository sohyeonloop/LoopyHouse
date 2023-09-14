package comm.dao;

import java.util.HashMap;
import java.util.List;

import shop.vo.SearchVO;
import user.dao.MyBatisDao;

public class PopSearchDaoImpl extends MyBatisDao implements IPopSearchDao {

	private static IPopSearchDao schDao;

	private PopSearchDaoImpl() {
	}

	public static IPopSearchDao getInstance() {
		if (schDao == null) {
			schDao = new PopSearchDaoImpl();
		}
		return schDao;
	}

	@Override
	public int insertPopSearch(SearchVO sv) {
		int cnt = insert("board.popSearchInsert", sv);
		return cnt;
	}

	@Override
	public int popSearchUpdate(SearchVO sv) {
		int cnt = update("board.popSearchUpdate", sv);
		return cnt;
	}

	@Override
	public boolean popSearchCheck(String setSchWord) {
		int cnt = 0;
		cnt = selectOne("board.popSearchCheck", setSchWord);
		boolean isExist = false;
		if (cnt > 0) {
			isExist = true;
		}

		return isExist;
	}

	@Override
	public List<SearchVO> popSearchSelect() {
		return selectList("board.popSearchSelect");
	}

}
