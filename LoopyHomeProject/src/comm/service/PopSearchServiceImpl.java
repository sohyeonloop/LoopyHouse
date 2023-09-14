package comm.service;

import java.util.HashMap;
import java.util.List;

import comm.dao.IPopSearchDao;
import comm.dao.PopSearchDaoImpl;
import shop.vo.SearchVO;

public class PopSearchServiceImpl implements IPopSearchService{

	private IPopSearchDao schDao;
	private static IPopSearchService schService;
	
	private PopSearchServiceImpl() {
		schDao = PopSearchDaoImpl.getInstance();
	}
	
	public static IPopSearchService getInstance() {
		if(schService == null) {
			schService = new PopSearchServiceImpl();
		}
		return schService;
	}
	
	@Override
	public int insertPopSearch(SearchVO sv) {
		return schDao.insertPopSearch(sv);
	}

	@Override
	public int popSearchUpdate(SearchVO sv) {
		return schDao.popSearchUpdate(sv);
	}

	@Override
	public boolean popSearchCheck(String setSchWord) {
		return schDao.popSearchCheck(setSchWord);
	}

	@Override
	public List<SearchVO> popSearchSelect() {
		return schDao.popSearchSelect();
	}

}
